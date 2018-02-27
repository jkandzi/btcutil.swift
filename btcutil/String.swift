//
//  String.swift
//  btcutil
//
//  Created by Justus Kandzi on 27.02.18.
//  Copyright © 2018 Justus Kandzi. All rights reserved.
//

import Foundation

public extension String {
    public func sha256() -> String {
        return data(using: .utf8)?.sha256().hexString() ?? ""
    }

    func indexDistance(of character: Character) -> Int? {
        guard let index = index(of: character) else { return nil }
        return distance(from: startIndex, to: index)
    }
}
