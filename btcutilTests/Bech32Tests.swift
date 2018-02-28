//
//  btcutilTests
//
//  Created by Justus Kandzi on 28.02.18.
//  Copyright © 2018 Justus Kandzi. All rights reserved.
//

import XCTest
@testable import btcutil

class Bech32Tests: XCTestCase {
    func testValidBech32() {
        let valid = [
            "A12UEL5L",
            "a12uel5l",
            "an83characterlonghumanreadablepartthatcontainsthenumber1andtheexcludedcharactersbio1tt5tgs",
            "abcdef1qpzry9x8gf2tvdw0s3jn54khce6mua7lmqqqxw",
            "11qqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqqc8247j",
            "split1checkupstagehandshakeupstreamerranterredcaperred2y9e3w"
        ]
        
        for input in valid {
            let decoded = Bech32.decode(input)
            XCTAssertNotNil(decoded)
        }
    }
    
    func testInvalidBech32() {
        let invalid = [
            "\u{20}1nwldj5",
            "\u{7F}1axkwrx",
            "\u{80}1eym55h",
            "an84characterslonghumanreadablepartthatcontainsthenumber1andtheexcludedcharactersbio1569pvx",
            "pzry9x0s0muk",
            "1pzry9x0s0muk",
            "x1b4n0q5v",
            "li1dgmt3",
            "de1lg7wt\u{FF}",
            "A1G7SGD8",
            "10a06t8",
            "1qzzfhee"
        ]
        
        for input in invalid {
            let decoded = Bech32.decode(input)
            XCTAssertNil(decoded)
        }
    }
    
    func testValidSegwitAddresses() {
        let valid: [(String, String)] = [
            ("BC1QW508D6QEJXTDG4Y5R3ZARVARY0C5XW7KV8F3T4", "0014751e76e8199196d454941c45d1b3a323f1433bd6"),
            ("tb1qrp33g0q5c5txsp9arysrx4k6zdkfs4nce4xj0gdcccefvpysxf3q0sl5k7", "00201863143c14c5166804bd19203356da136c985678cd4d27a1b8c6329604903262"),
            ("bc1pw508d6qejxtdg4y5r3zarvary0c5xw7kw508d6qejxtdg4y5r3zarvary0c5xw7k7grplx", "5128751e76e8199196d454941c45d1b3a323f1433bd6751e76e8199196d454941c45d1b3a323f1433bd6"),
            ("BC1SW50QA3JX3S", "6002751e"),
            ("bc1zw508d6qejxtdg4y5r3zarvaryvg6kdaj", "5210751e76e8199196d454941c45d1b3a323"),
            ("tb1qqqqqp399et2xygdj5xreqhjjvcmzhxw4aywxecjdzew6hylgvsesrxh6hy", "0020000000c4a5cad46221b2a187905e5266362b99d5e91c6ce24d165dab93e86433")
        ]
        
        for (input, output) in valid {
            let decoded = Bech32.decode(input)
            XCTAssertNotNil(decoded)
            if let (humanReadablePart, _) = decoded {
                let res = SegwitAddress.decode(hrp: humanReadablePart, addr: input)
                XCTAssertEqual(res?.program.hexString(), output)
            }
        }
    }
}