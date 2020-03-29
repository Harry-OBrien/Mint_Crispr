//
//  main.cpp
//  MintCrisprFirmware
//
//  Created by Harry O'Brien on 21/08/2019.
//  Copyright © 2019 SociaDevLtd. All rights reserved.
//

//////////////////////////////////////////////////////////////////////
//
//  Error States:
//    1: bluetooth disconnected (rapid flash)
//    2: sensor failure (long flash)
//    3: [unassigned] (double flash)
//
//////////////////////////////////////////////////////////////////////

// External Libraries
#include <Arduino.h>

// internal file headers
// #include "LuxSensor.hpp"
// #include "bluetoothInterface.hpp"
#include "ResponseFormatter.hpp"
// #include "ErrorHandler.hpp"

// Global Vars
// LuxSensor luxSensor;
// BluetoothInterface btInferface(3, 4, 5);

// doofers
// void bleStateChange();

// MARK: - Setup
void setup() {
  Serial.begin(9600);
  Serial.println("test: ");

  // Setup sensor an bluetooth
  // luxSensor.init();
  // btInferface.init();

  // set up hardware interrupt for checking if the bluetooth device has a
  // connection (pin D3)
  // attachInterrupt(digitalPinToInterrupt(3), bleStateChange, CHANGE);

  ResponseFormatter rFormat;

  rFormat << JSON::ValuePair<int>("scanDurationSecs", 14);
  rFormat << JSON::ValuePair<int>("sensorsLastCalibratedSecs", 300);

  JSON::BaseValuePair pairArr[2];
  JSON::UnitDetail unitDetail[4];

  // sensor 1
  JSON::BaseValuePair pair1[2] = {JSON::ValuePair<int>("sensorNumber", 1), JSON::ValuePair<int>("value", 1)};
  unitDetail[0] = JSON::UnitDetail(pair1, 2);

  // sensor 2
  JSON::BaseValuePair pair2[2] = {JSON::ValuePair<int>("sensorNumber", 2), JSON::ValuePair<int>("value", 1)};
  unitDetail[1] = JSON::UnitDetail(pair2, 2);

  // sensor 3
  JSON::BaseValuePair pair3[2] = {JSON::ValuePair<int>("sensorNumber", 3), JSON::ValuePair<int>("value", 1)};
  unitDetail[2] = JSON::UnitDetail(pair3, 2);

  // sensor 4
  JSON::BaseValuePair pair4[2] = {JSON::ValuePair<int>("sensorNumber", 4), JSON::ValuePair<int>("value", 1)};
  unitDetail[3] = JSON::UnitDetail(pair4, 2);

  rFormat << JSON::Array("sensorsValues", unitDetail, 4);

  char* response = rFormat.returnJsonResponse();

  // Serial.println(response);
  // Serial.println(response.length());
  Serial.println("\nDone!");
}

// MARK: - Loop
void loop() {

  // while (!btInferface.isConnected()) {
    // TODO: be able to get error flash stopped immediatly
    // (probs using timers for the flash?)
    // ErrorHandler::getInstance().error(1); //error: no bluetooth connection
  // }


  // btInferface.writeToBluetooth(response);
  delay(1000);

  // while(true);










  // wait for command to come in

  // ---------------------------------- //

  // cmd 1 (read sensor)
  // read sensor data -> get stabalised result
  // send result back over bluetooth

  // cmd 2 (info):
  // print bluetooth details
  // print all sensor details

  // cmd 3 (recalibrate)
  // call the sensor calibration function
  // return "OK"
}

// MARK: - ISR
// void bleStateChange() {
//   bool connected = digitalRead(3);
//   btInferface.setConnectionState(connected);
// }
