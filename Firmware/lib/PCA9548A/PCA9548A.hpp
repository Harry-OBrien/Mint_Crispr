
#ifndef LIB_PCA9548A_HPP
#define LIB_PCA9548A_HPP

#ifndef UNIT_TEST
#include <Arduino.h>
#else
#include <Arduino_Mock.hpp>
#endif

class PCA9548A
{
    // Reset pin is active low
    uint8_t const rst_pin;
    uint8_t const addr;

    uint8_t active_channels = 0x00;

public:
    PCA9548A(uint8_t _rst_pin, uint8_t _addr = 0x70);
    bool init();
    void reset();

    uint8_t set_channel_active(uint8_t channel);

    uint8_t set_channel_inactive(uint8_t channel);

    uint8_t get_tracked_active_channels();
    uint8_t read_active_channels();

private:
    uint8_t read8(uint8_t reg);
    void write8(uint8_t reg, uint8_t value);
};

#endif /* LIB_PCA9548A_HPP */