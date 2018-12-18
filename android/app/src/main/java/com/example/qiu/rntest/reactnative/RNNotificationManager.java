package com.example.qiu.rntest.reactnative;

import com.facebook.react.bridge.ReactContext;
import com.facebook.react.bridge.WritableMap;
import com.facebook.react.modules.core.DeviceEventManagerModule;

import javax.annotation.Nullable;

public class RNNotificationManager {
    //定义上下文
    public static  ReactContext mContext;

    //发送事件到RN端
    public static void sendRNEvent(String eventName, @Nullable WritableMap params){
        mContext.getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter.class).emit(eventName,params);
    }
}
