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
}

struct Test {
    let diseaseUnderTest: String
    let result: Bool
}
