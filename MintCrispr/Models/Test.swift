//
//  Test.swift
//  MintCrispr
//
//  Created by Harry on 28/10/2019.
//  Copyright © 2019 SociaDevLtd. All rights reserved.
//

import Foundation

struct TestGroup {
    let testsPerformed: [Test]
    let timeStamp: Date
	var testCount: Int {
		return testsPerformed.count
	}
	
//	static func parseFromFirebaseData(_ data: [String : Any]) -> TestGroup {
//
//	}
}

struct Test {
    let diseaseUnderTest: String
    let result: Bool
	
//	static func parseFromFirebaseData(_ data: [String : Any]) -> Test {
//		
//	}
}
