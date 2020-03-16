//
//  CryptoTools.swift
//  common
//
//  Created by lmcmz on 13/3/20.
//  Copyright © 2020 DAOstack. All rights reserved.
//

import Foundation
import CryptoSwift
import UIKit

class CryptoTool: NSObject {
    // encode
    public static func endcodeAESECB(dataToEncode: Data, key: String) throws -> Data {
        do {
            let aes = try AES(key: Padding.zeroPadding.add(to: key.bytes, blockSize: AES.blockSize), blockMode: ECB())
            let encoded = try aes.encrypt(dataToEncode.bytes)
            return Data(fromArray: encoded)
        } catch {
            print(error.localizedDescription)
            throw error
        }
    }

    // decode
    public static func decodeAESECB(dataToDecode: Data, key: String) throws -> Data {
        let encrypted: [UInt8] = dataToDecode.bytes
        do {
            let aes = try AES(key: Padding.zeroPadding.add(to: key.bytes, blockSize: AES.blockSize), blockMode: ECB())
            let decode = try aes.decrypt(encrypted)
            let encoded = Data(decode)
            return encoded
        } catch {
            throw error
        }
    }
}

