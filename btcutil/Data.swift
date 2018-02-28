//
//  btcutil
//
//  Created by Justus Kandzi on 27.02.18.
//  Copyright © 2018 Justus Kandzi. All rights reserved.
//

import Foundation
import CommonCrypto

extension Data {
    var bytes: [UInt8] {
        return withUnsafeBytes { (bytes: UnsafePointer<UInt8>) in
            Array(UnsafeBufferPointer(start: bytes, count: count / MemoryLayout<UInt8>.stride))
        }
    }
    
    func sha256() -> Data {
        let digestLength = Int(CC_SHA256_DIGEST_LENGTH)
        var hash = [UInt8](repeating: 0, count: digestLength)
        CC_SHA256(bytes, UInt32(count), &hash)
        return Data(hash)
    }
    
    func hexString() -> String {
        return bytes.reduce("") { $0 + String(format:"%02x", UInt8($1)) }
    }
}
