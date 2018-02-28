//
//  Bolt11.swift
//  btcutil
//
//  Created by Justus Kandzi on 28.02.18.
//  Copyright © 2018 Justus Kandzi. All rights reserved.
//

import Foundation

enum Bolt11 {
    static func isValid(_ string: String) -> Bool {
        return Bech32.decode(string, limit: false) != nil
    }
}
