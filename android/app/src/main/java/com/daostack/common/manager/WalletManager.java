package com.daostack.common.manager;

import android.os.Environment;

import com.fasterxml.jackson.core.util.DefaultPrettyPrinter;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;

import com.daostack.common.async.WorkThreadHandler;
import com.daostack.common.async.*;

import org.web3j.crypto.Bip32ECKeyPair;
import org.web3j.crypto.Credentials;
import org.web3j.crypto.MnemonicUtils;
import org.web3j.crypto.Wallet;
import org.web3j.crypto.WalletFile;
import org.web3j.protocol.Web3j;

import java.io.File;
import java.security.SecureRandom;

import io.reactivex.disposables.CompositeDisposable;
import com.orhanobut.hawk.Hawk;
import com.fasterxml.jackson.databind.ObjectWriter;
import com.daostack.common.util.*;
import com.daostack.common.config.*;

import static com.daostack.common.config.Constants.KEY_ADDRESS;
import static com.daostack.common.config.Constants.KEY_STORE_PATH;
import static com.daostack.common.config.Constants.MEMORIZINGWORDS;

public class WalletManager {

    private Web3j web3j;
    private int HARDENED_BIT = 0x80000000;
    private Credentials mCredentials;
    private CompositeDisposable mCompositeDisposable;

    private static class Web3jManagerHolder {
        private final static WalletManager instance = new WalletManager();
    }

    private static final ObjectMapper objectMapper = new ObjectMapper();

    public static WalletManager getInstance() {
        return Web3jManagerHolder.instance;
    }

    public void createWallet(BaseListener<String> listener) {
        checkNull(listener);
        WorkThreadHandler.getInstance().post(() -> {
            try{

                byte[] initialEntropy = new byte[16];
                SecureRandom secureRandom = new SecureRandom();
                secureRandom.nextBytes(initialEntropy);
                String memorizingWords = MnemonicUtils.generateMnemonic(initialEntropy);

                byte[] seed = MnemonicUtils.generateSeed(memorizingWords, "");
                Bip32ECKeyPair masterKeypair = Bip32ECKeyPair.generateKeyPair(seed);
                final int[] path = {44 | HARDENED_BIT, 60 | HARDENED_BIT, 0 | HARDENED_BIT, 0, 0};
                Bip32ECKeyPair childKeypair = Bip32ECKeyPair.deriveKeyPair(masterKeypair, path);
                mCredentials = Credentials.create(childKeypair);

                File storagePath = Environment.getExternalStorageDirectory();
                WalletFile walletFile = Wallet.createStandard("", childKeypair);
                File filePath = new File(storagePath, "/keystore.json");

                ObjectWriter writer = objectMapper.writer(new DefaultPrettyPrinter());
                writer.writeValue(filePath, walletFile);

                Hawk.put(MEMORIZINGWORDS, memorizingWords);
                Hawk.put(KEY_STORE_PATH, filePath.getAbsolutePath());

                LogUtil.d("Create success! memorizingWords = " + memorizingWords + ",save path is" + storagePath.getAbsolutePath());
                MainHandler.getInstance().post(() -> {
                    listener.OnSuccess(memorizingWords);
                });

            } catch (Exception e) {
                LogUtil.d(e.getMessage());
                MainHandler.getInstance().post(() -> {
                    listener.OnFailed(e);
                });
            }
        });
    }




    private void checkNull(BaseListener listener) {
        if (listener == null) {
            LogUtil.e("listener is null");
            return;
        }
        if (web3j == null) {
            listener.OnFailed(new IllegalArgumentException("Web3j build failed"));
            return;
        }
    }

}
