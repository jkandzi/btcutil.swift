//
//  cryptoTests.swift
//  btcutilTests
//
//  Created by Justus Kandzi on 27.02.18.
//  Copyright © 2018 Justus Kandzi. All rights reserved.
//

import XCTest
import btcutil

class cryptoTests: XCTestCase {
    func testSha256() {
        XCTAssertEqual("Esel".sha256(), "cf798ea63b33c57af842e9cb3975a9e9bfb876e38d8054d2ebef8bfa3f5839a0")
    }
}
