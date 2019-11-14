//
//  ScannerDevice.swift
//  MintCrispr
//
//  Created by Harry O'Brien on 13/08/2019.
//  Copyright © 2019 SociaDevLtd. All rights reserved.
//

import Foundation

struct ScannerDevice {
    let id: String
	let hospitalDepartmentReference: String
	
	let deviceName: String
	let lastSeenDateTime: Date
	let online: Bool
	
	var readableLastSeenDate: String {
		let df = DateFormatter()
		df.dateStyle = .medium
		return df.string(from: lastSeenDateTime)
	}
}
