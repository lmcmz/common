package com.daostack.common.bridge;

import android.widget.Toast;

import com.daostack.common.manager.WalletManager;
import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

import org.web3j.crypto.Credentials;
import org.web3j.protocol.core.methods.response.EthGetBalance;
import org.web3j.utils.Convert;

import com.daostack.common.async.*;

import javax.annotation.Nonnull;

public class WalletModule extends ReactContextBaseJavaModule {


    public WalletModule(ReactApplicationContext reactContext) {
        super(reactContext);
    }

    @Nonnull
    @Override
    public String getName() {
        return "WalletModule";
    }

//    @ReactMethod
//    public void getAddress(Promise promise) {
//        WalletManager.getInstance().importWallet(new BaseListener<Credentials>() {
//            @Override
//            public void OnSuccess(Credentials credentials) {
//                promise.resolve(credentials.getAddress());
//            }
//
//            @Override
//            public void OnFailed(Throwable e) {
//                promise.reject(e.toString());
//            }
//        });
//    }
//
//    @ReactMethod
//    public void getBalance(Promise promise) {
//        Web3jManager.getInstance().checkBalances(new BaseListener<EthGetBalance>() {
//
//            @Override
//            public void OnSuccess(EthGetBalance balance) {
//                String blanceETH = Convert.fromWei(balance.getBalance().toString(), Convert.Unit.ETHER).toPlainString().concat("ether");
//                Toast.makeText(getReactApplicationContext(),"getBalance:" + blanceETH,Toast.LENGTH_LONG).show();
//                promise.resolve(blanceETH);
//            }
//
//            @Override
//            public void OnFailed(Throwable e) {
//                promise.reject(e.toString());
//            }
//        });
//    }

    @ReactMethod
    public void signMessage(String message,Promise promise) {

    }
}
