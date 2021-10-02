//
//  main.cpp
//  MintCrisprFirmware
//
//  Created by Harry O'Brien on 21/08/2019.
//  Copyright © 2019 SociaDevLtd. All rights reserved.
//

#ifndef UNIT_TEST
#include <Arduino.h>
#else
#include <Arduino_Mock.hpp>
#endif

#include <PCA9548A.hpp>
#include <TSL2561.h>

PCA9548A i2c_mux(10);
TSL2561 *tsl;
uint8_t const sensor_count = 16;

void fail_with_reason(String reason)
{
  Serial.println(reason);
  while (true)
    ;
}
void setup()
{
  // Begin flashing setup LED
  // ...

  // Initialise bluetooth
  // ...

  // Initialise I2C
  Wire.begin();

  // Initialise mux
  if (!i2c_mux.init())
    fail_with_reason("I2C mux failed.");

  // TODO: Abstract muxed light sensors into struct
  // Initialise tsl sensors
  tsl = (TSL2561 *)calloc(16, sizeof(TSL2561));
  if (tsl == nullptr)
    fail_with_reason("Mem alloc failed when initialising TSL sensors");

  for (int i = 0; i < sensor_count / 2; i++)
  {
    i2c_mux.set_channel_active(i);

    tsl[i * 2] = TSL2561(TSL2561_ADDR_LOW);
    tsl[i * 2 + 1] = TSL2561(TSL2561_ADDR_HIGH);

    if (!tsl[i * 2].begin() || !tsl[i * 2 + 1].begin())
    {
      Serial.println(i * 2);
      fail_with_reason("tsl sensor failed to init");
    }

    i2c_mux.set_channel_inactive(i);
  }

  // Stop flashing setup LED
  // ...
}

void loop()
{
  for (uint8_t i = 0; i < sensor_count / 2; i++)
  {
    i2c_mux.set_channel_active(i);

    {
      char buf[26];
      sprintf(buf, "Sensor %u: %lu", i, tsl[i * 2].getFullLuminosity());
      Serial.println(buf);
    }

    {
      char buf[26];
      sprintf(buf, "Sensor %u: %lu", i + 1, tsl[i * 2 + 1].getFullLuminosity());
      Serial.println(buf);
    }

    i2c_mux.set_channel_inactive(i);
  }

  Serial.println("\n");
  delay(2000);
}
