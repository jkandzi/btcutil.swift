//
//  base58Tests.swift
//  btcutilTests
//
//  Created by Justus Kandzi on 27.02.18.
//  Copyright © 2018 Justus Kandzi. All rights reserved.
//

import XCTest
@testable import btcutil

class base58Tests: XCTestCase {
    func testBase58() {
        let data = Base58.decode("StV1DL6CwTryKyV")
        XCTAssertNotNil(data)
        XCTAssertEqual(String(data: data!, encoding: .utf8), "hello world")
    }
    
    func testBase58WithLeadingZeros() {
        let data = Base58.decode("11StV1DL6CwTryKyV")
        XCTAssertNotNil(data)
        XCTAssertEqual(String(data: data!, encoding: .utf8), "\0\0hello world")
    }
}
