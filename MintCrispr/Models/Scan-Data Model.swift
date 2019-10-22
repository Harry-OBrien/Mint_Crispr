//
//  Scan-Data Model.swift
//  MintCrispr
//
//  Created by Harry O'Brien on 21/08/2019.
//  Copyright © 2019 SociaDevLtd. All rights reserved.
//

import Foundation

struct SensorReading {
	let diseaseTestName: String //i.e. 'Malaria'
	let positiveReading: Bool
	let percentageCertainty: Double
}

struct ScanData {
	let patientName: String
	let timeDate: Date
	let scanValue: [SensorReading]
	var readableDate: String {
		let df = DateFormatter()
		df.dateStyle = .medium
		return df.string(from: timeDate)
	}
	
	static func mockScanData() -> [ScanData] {
		return [
			ScanData(patientName: "Harry O'Brien",
					 timeDate: Date(),
					 scanValue: [
						SensorReading(diseaseTestName: "Malaria", positiveReading: false, percentageCertainty: 100),
						SensorReading(diseaseTestName: "Syphilis", positiveReading: false, percentageCertainty: 89),
						SensorReading(diseaseTestName: "Ebola", positiveReading: false, percentageCertainty: 90)
				]
			),
			
			ScanData(patientName: "Effy Stonem",
					 timeDate: Date(),
					 scanValue: [
						SensorReading(diseaseTestName: "Malaria", positiveReading: true, percentageCertainty: 100),
						SensorReading(diseaseTestName: "Syphilis", positiveReading: false, percentageCertainty: 100),
						SensorReading(diseaseTestName: "Ebola", positiveReading: false, percentageCertainty: 100)
				]
			),
			
			ScanData(patientName: "Dave Franco",
					 timeDate: Date(),
					 scanValue: [
						SensorReading(diseaseTestName: "Malaria", positiveReading: true, percentageCertainty: 100),
						SensorReading(diseaseTestName: "Syphilis", positiveReading: false, percentageCertainty: 100),
						SensorReading(diseaseTestName: "Ebola", positiveReading: false, percentageCertainty: 100)
				]
			),
			
			ScanData(patientName: "Hermione Granger",
					 timeDate: Date(),
					 scanValue: [
						SensorReading(diseaseTestName: "Malaria", positiveReading: true, percentageCertainty: 100),
						SensorReading(diseaseTestName: "Syphilis", positiveReading: false, percentageCertainty: 100),
						SensorReading(diseaseTestName: "Ebola", positiveReading: false, percentageCertainty: 100)
				]
			),
			
			ScanData(patientName: "Lukas Adams",
					 timeDate: Date(),
					 scanValue: [
						SensorReading(diseaseTestName: "Malaria", positiveReading: true, percentageCertainty: 100),
						SensorReading(diseaseTestName: "Syphilis", positiveReading: false, percentageCertainty: 100),
						SensorReading(diseaseTestName: "Ebola", positiveReading: false, percentageCertainty: 100)
				]
			),
		]
	}
}
