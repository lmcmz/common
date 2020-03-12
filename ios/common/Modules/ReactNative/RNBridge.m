//
//  RNBridge.m
//  common
//
//  Created by lmcmz on 12/3/20.
//  Copyright © 2020 DAOstack. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>

# pragma - Wallet

@interface RCT_EXTERN_MODULE(WalletModule, NSObject)

RCT_EXTERN_METHOD(createSeedPhrase:(RCTPromiseResolveBlock)resolve
                  reject:(RCTPromiseRejectBlock)reject)

@end
