//
//  base58.swift
//  btcutil
//
//  Created by Justus Kandzi on 27.02.18.
//  Copyright © 2018 Justus Kandzi. All rights reserved.
//

import Foundation
import BigInt

class Base58 {
    private static let alphabet = "123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz"
    
    static func decode(_ input: String) -> Data? {
        let bigRadix = BigUInt(58)

        var answer = BigUInt(0)
        var j = BigUInt(1)

        for character in input.reversed() {
            guard let tmp = Base58.alphabet.indexDistance(of: character) else { return nil }
            answer += (BigUInt(tmp) * j)
            j *= bigRadix
        }
    
        let leadingZeros = input.prefix(while: { $0 == "1" }).count
        let prefix = Data(bytes: Array<UInt8>(repeating: 0, count: leadingZeros))

        return prefix + answer.serialize()
    }
}

/*
public func isValidAddress(_ address: String) -> Bool {
    guard
        address.count >= 26 && address.count <= 35,
        let decoded = Base58.decode(address)
        else { return false }

    let hash = decoded.sha256()
    
    print(hash)
    
    return true
}
*/
