//
//  WalletManager.swift
//  common
//
//  Created by lmcmz on 12/3/20.
//  Copyright © 2020 DAOstack. All rights reserved.
//

import Foundation
import web3swift

public class WalletManager {
    public class func createSeedPhrase() -> String? {
        do {
            let bitsOfEntropy: Int = 128 // Entropy is a measure of password strength. Usually used 128 or 256 bits.
            let mnemonics = try BIP39.generateMnemonics(bitsOfEntropy: bitsOfEntropy)
            return mnemonics
        } catch {
            return nil
        }
    }
}
