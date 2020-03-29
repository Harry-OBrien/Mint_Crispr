//
//  LuxSensor.h
//  MintCrisprFirmware
//
//  Created by Harry O'Brien on 21/08/2019.
//  Copyright © 2019 SociaDevLtd. All rights reserved.
//

#ifndef LuxSensor_h
#define LuxSensor_h

#include "TSL2561.h"
#include <Arduino.h>
#include <Wire.h>
#include "ErrorHandler.hpp"

class LuxSensor {

  // Sensor lib
  TSL2561 tsl;

public:
  LuxSensor(int addr = 0x29) : tsl(addr) {}

  void init() {
    if (!tsl.begin()) {
      Serial.println("No sensor?");
      while (true)
        ErrorHandler::getInstance().error(2);
    }

    tsl.setGain(TSL2561_GAIN_16X);
    tsl.setTiming(TSL2561_INTEGRATIONTIME_402MS);
  }

  uint16_t getLuminosityReading() { return tsl.getLuminosity(TSL2561_VISIBLE); }
};

#endif /* define LuxSensor_h */
