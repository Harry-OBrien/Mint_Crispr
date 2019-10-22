//
//  ScannerDevice.swift
//  MintCrispr
//
//  Created by Harry O'Brien on 13/08/2019.
//  Copyright © 2019 SociaDevLtd. All rights reserved.
//

import Foundation

struct ScannerDevice {
	let deviceName: String
	let lastSeenDateTime: Date
	let online: Bool
	let scanCount: Int
	var readableLastSeenDate: String {
		let df = DateFormatter()
		df.dateStyle = .medium
		return df.string(from: lastSeenDateTime)
	}
	
	// insert bluetooth data below...
	
	static func getArchivedScannerInformation() -> [ScannerDevice] {
		//TODO: Initialise core data storage
		return [ScannerDevice]()
	}
	
	static func getMockScanners() -> [ScannerDevice] {
		return [
			ScannerDevice(deviceName: "Scanner 1", lastSeenDateTime: Date(), online: true, scanCount: 5),
			ScannerDevice(deviceName: "Scanner 2", lastSeenDateTime: Date(timeIntervalSinceNow: -100000), online: false, scanCount: 16),
			ScannerDevice(deviceName: "Scanner 3", lastSeenDateTime: Date(timeIntervalSinceNow: -400000), online: false, scanCount: 7),
			ScannerDevice(deviceName: "Scanner 4", lastSeenDateTime: Date(), online: true, scanCount: 2),
			ScannerDevice(deviceName: "Scanner 5", lastSeenDateTime: Date(timeIntervalSinceNow: -1000000), online: false, scanCount: 28),
			ScannerDevice(deviceName: "Scanner 6", lastSeenDateTime: Date(timeIntervalSinceNow: -50000), online: false, scanCount: 0)
		]
	}
}
