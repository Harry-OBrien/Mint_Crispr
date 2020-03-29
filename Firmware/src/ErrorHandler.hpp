//
//  ErrorHandler.hpp
//  MintCrisprFirmware
//
//  Created by Harry O'Brien on 21/08/2019.
//  Copyright © 2019 SociaDevLtd. All rights reserved.
//

#ifndef ErrorHandler_h
#define ErrorHandler_h

class ErrorHandler {

  uint8_t ledPinNumber = 13;
  uint16_t timeBetweenLedStateChangeMilis = 100;

  bool flashPattern1[10] = {1, 0, 1, 0, 1, 0, 1, 0, 1, 0}; // (200ms)
  bool flashPattern2[10] = {1, 1, 1, 1, 1, 0, 0, 0, 0, 0}; // (1000ms)
  bool flashPattern3[10] = {1, 0, 1, 0, 0, 0, 0, 0, 0, 0}; // (2 x 100ms)

public:
  static ErrorHandler &getInstance() {
    static ErrorHandler instance;
    return instance;
  }

  ErrorHandler(ErrorHandler const &) = delete;
  void operator=(ErrorHandler const &) = delete;

  void error(int errorState) {
    switch (errorState) {
    case 1:
      flash(flashPattern1);
      break;

    case 2:
      flash(flashPattern2);
      break;

    case 3:
      flash(flashPattern3);
      break;

    default:
      break;
    }
  }

private:
  ErrorHandler() { pinMode(ledPinNumber, OUTPUT); }

  void flash(bool pattern[10]) {
    for (int i = 0; i < 10; i++) {
      digitalWrite(ledPinNumber, pattern[i]);
      delay(timeBetweenLedStateChangeMilis);
    }
  }
};

#endif /* define ErrorHandler_h */
