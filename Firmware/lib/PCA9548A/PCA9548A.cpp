
#include "PCA9548A.hpp"

#ifndef UNIT_TEST
#include <Wire.h>
#endif

PCA9548A::PCA9548A(uint8_t _rst_pin, uint8_t _addr)
    : rst_pin(_rst_pin),
      addr(_addr)
{
    pinMode(rst_pin, OUTPUT);
}

bool PCA9548A::init()
{
    return true;
}

void PCA9548A::reset()
{
    digitalWrite(rst_pin, LOW);
    delay(2);
    digitalWrite(rst_pin, HIGH);

    active_channels = 0x00;
}

/**
 * @param channel channel (0 -> 7) to set active
 * @return map of active busses
 */
uint8_t PCA9548A::set_channel_active(uint8_t channel)
{
    // return early if passed invalid channel
    if (channel >= 8)
        return active_channels;

    // update active channel
    active_channels |= (1 << channel);

    // Write to device
    write8(addr << 1, active_channels);

    // return active busses
    return active_channels;
}

/**
 * @param channel bus (0 -> 7) to set inactive
 * @return map of active channel
 */
uint8_t PCA9548A::set_channel_inactive(uint8_t channel)
{
    // return early if passed invalid channel
    if (channel >= 8)
        return active_channels;

    // update active bus
    active_channels &= !(1 << channel);

    // Data is transmitted to the PCA9548A by sending the device address and setting the
    // least-significant bit (LSB) to a logic 0
    write8(addr << 1, active_channels);

    // return active busses
    return active_channels;
}

uint8_t PCA9548A::get_tracked_active_channels()
{
    return active_channels;
}

uint8_t PCA9548A::read_active_channels()
{
    // The bus master first must send the PCA9548A address with the LSB set to a logic 1
    return read8((addr << 1) | 1);
}

void PCA9548A::write8(uint8_t reg, uint8_t value)
{
    Wire.beginTransmission(addr);

    Wire.write(reg);
    Wire.write(value);

    Wire.endTransmission();
}

uint8_t PCA9548A::read8(uint8_t reg)
{
    Wire.beginTransmission(addr);
    Wire.write(reg);
    Wire.endTransmission();

    Wire.requestFrom(addr, (uint8_t)1);
    return Wire.read();
}