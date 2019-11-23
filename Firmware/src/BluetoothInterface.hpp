//
//  BluetoothInterface.h
//  MintCrisprFirmware
//
//  Created by Harry O'Brien on 21/08/2019.
//  Copyright © 2019 SociaDevLtd. All rights reserved.
//

#ifndef BluetoothInterface_h
#define BluetoothInterface_h

#include <Arduino.h>
#include <SoftwareSerial.h>

class BluetoothInterface {

private:
  SoftwareSerial ble;

  uint8_t statePin;
  bool connectionState;
  uint8_t rxPin, txPin;

public:

  BluetoothInterface(int _statePin, int rxPin, int txPin)
      : ble(rxPin, txPin), statePin(_statePin) {
  }

  void init() { connectionState = digitalRead(statePin); }

  bool isConnected() { return connectionState; }
  void setConnectionState(bool state) { connectionState = state; }

  String readFromBluetooth() { return ble.readStringUntil('\n'); }
  void writeToBluetooth(String content) { ble.write(content.c_str()); }

};

#endif /* define BluetoothInterface_h */
