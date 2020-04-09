//
//  main.cpp
//  MintCrisprFirmware
//
//  Created by Harry O'Brien on 21/08/2019.
//  Copyright © 2019 SociaDevLtd. All rights reserved.
//

#include <Arduino.h>

// #include "LuxSensor.hpp"
#include "bluetoothInterface.hpp"

bool ledIsActive = false;

void setup() {
  pinMode(2, OUTPUT);
  pinMode(6, OUTPUT);
  pinMode(7, OUTPUT);

  TIMSK0 = _BV(OCIE0A);  // Enable Interrupt TimerCounter0 Compare Match A (SIG_OUTPUT_COMPARE0A)
  TCCR0A = _BV(WGM01);  // Mode = CTC
  TCCR0B = _BV(CS02) | _BV(CS00);   // Clock/1024, 0.001024 seconds per tick
  OCR0A = 244;          // 0.001024*244 ~= .25 SIG_OUTPUT_COMPARE0A will be triggered 4 times per second.

  sei();
}

// MARK: - Loop
void loop() {
  BluetoothInterface bt(3, 4, 5);
  bt.init();

  while(true) {
    if(bt.isAvailable()) {
      bt.write(bt.readLine());
    }
  }
}

ISR(TIMER0_COMPA_vect)
{
  digitalWrite(2, ledIsActive);
  digitalWrite(6, ledIsActive);
  digitalWrite(7, ledIsActive);
  ledIsActive ^= 1;
}
