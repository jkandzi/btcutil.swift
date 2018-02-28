//
//  address.swift
//  btcutil
//
//  Created by Justus Kandzi on 28.02.18.
//  Copyright © 2018 Justus Kandzi. All rights reserved.
//

import Foundation

public struct Address {
    public enum AddressType: Int {
        case pubkeyHash = 0
        case scriptHash = 5
        case privateKey = 128
        case testnetPubkeyHash = 111
        case testnetScriptHash = 196
        case testnetPrivateKey = 239
    }
    
    public let type: AddressType
    public let string: String
    
    public init?(string: String) {
        guard
            let (version, _) = Base58Check.checkDecode(string),
            let type = AddressType(rawValue: version)
            else { return nil }
        
        self.string = string
        self.type = type
    }
}
