//
//  WalletManager.swift
//  common
//
//  Created by lmcmz on 12/3/20.
//  Copyright © 2020 DAOstack. All rights reserved.
//

import Foundation
import web3swift
import KeychainAccess

public class WalletManager {
    
    static var shared = WalletManager()
    
    // TODO: Replace with xDai
    // https://dai.poa.network
    var web3Net = Web3.InfuraRinkebyWeb3()
    var keystore: BIP32Keystore?
    var keychain: Keychain?
    var address: EthereumAddress?
    
    private let keychainKey = "mnemonic"
    let defaultPassword = "daostack"
    let keystoreDirectoryName = "/keystore"
    let keystoreFileName = "/key.json"
    
    init() {
        keychain = Keychain(service: "com.daostack.common")
    }
    
    class func hasWallet() -> Bool {
        if let _ = WalletManager.shared.address {
            return true
        }
        return false
    }
    
    func loadFromCache() {
        guard let keystore = try? WalletManager.shared.loadKeystore() else {
            return
        }
        // Load web3 net from user defaul
        self.keystore = keystore

        // Wait for acccunt loaded
        address = keystore.addresses?.last!
        web3Net.addKeystoreManager(KeystoreManager([keystore]))
    }
    
    func createSeedPhrase() throws -> String? {
        do {
            let bitsOfEntropy: Int = 128 // Entropy is a measure of password strength. Usually used 128 or 256 bits.
            let mnemonics = try BIP39.generateMnemonics(bitsOfEntropy: bitsOfEntropy)
            keychain![keychainKey] = mnemonics
            return mnemonics
        } catch {
            throw WalletError.custom("Create mnemonics failed")
        }
    }
    
    func createWallet(mnemonics: String) throws {
        do {
            guard let keystore = try BIP32Keystore(mnemonics: mnemonics) else {
                throw WalletError.malformedKeystore
            }
            self.keystore = keystore
            self.address = keystore.addresses?.first
            try WalletManager.shared.saveKeystore(keystore)
            web3Net.addKeystoreManager(KeystoreManager([keystore]))
        } catch {
            throw WalletError.malformedKeystore
        }
    }
    
    /// Message is hex data string
    func signMessage(message: String) throws -> String? {
        
        guard let address = WalletManager.shared.address else {
            throw WalletError.invalidAddress
        }

        guard let keystore = web3Net.provider.attachedKeystoreManager else {
            throw WalletError.malformedKeystore
        }

        guard let data = Data.fromHex(message) else {
            throw WalletError.custom("Data")
        }
        
        do {
            let signedData = try Web3Signer.signPersonalMessage(data,
                                                                keystore: keystore,
                                                                account: address,
                                                                password: defaultPassword)
            return (signedData?.toHexString().addHexPrefix())!
        } catch {
            throw WalletError.messageFailedToData
        }
    }
    
}
