//
//  WalletModule.swift
//  common
//
//  Created by lmcmz on 12/3/20.
//  Copyright © 2020 DAOstack. All rights reserved.
//

import Foundation

@objc(WalletModule)
class WalletModule: NSObject {
    
    @objc func createSeedPhrase(resolve: @escaping RCTPromiseResolveBlock,
                                reject: @escaping RCTPromiseRejectBlock) {
        DispatchQueue.main.async {
            guard let seed = WalletManager.createSeedPhrase() else{
                reject("1", "Create seed phrase failed", nil)
                return
            }
            resolve(seed)
        }
    }
    
}
