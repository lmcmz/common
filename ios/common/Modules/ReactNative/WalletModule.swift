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
            do {
                let seed = try WalletManager.shared.createSeedPhrase()
                resolve(seed)
            } catch {
                reject("1", "Create seed phrase failed", nil)
            }
        }
    }
    
    
    @objc func signMessgae(message: String,
                           resolve: @escaping RCTPromiseResolveBlock,
                           reject: @escaping RCTPromiseRejectBlock) {
        DispatchQueue.main.async {
            do {
                let signed = try WalletManager.shared.signMessage(message: message)
                resolve(signed)
            } catch {
                reject("2", "Sign Data failed", nil)
            }
        }
    }
    
}
