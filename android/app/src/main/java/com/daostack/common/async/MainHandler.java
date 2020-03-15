package com.daostack.common.async;

import android.content.Context;
import android.os.Handler;

public class MainHandler extends Handler {

    private static MainHandler sInstance;
    private Context mContext;

    public static void init(Context context){
        sInstance = new MainHandler(context);
    }

    public static MainHandler getInstance(){
        return sInstance;
    }

    private MainHandler(Context context){
        mContext = context;
    }

}