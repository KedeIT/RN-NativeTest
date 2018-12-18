package com.example.qiu.rntest.reactnative;

import android.content.Intent;
import android.widget.Toast;

import com.facebook.react.bridge.Callback;
import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.uimanager.IllegalViewOperationException;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Nullable;

public class RNInterractModule extends ReactContextBaseJavaModule {

    private ReactContext mReactContext;
    private static final String RNEmitter = "RNEmitter";

    public RNInterractModule(ReactApplicationContext reactContext) {
        super(reactContext);
        this.mReactContext = reactContext;
        //赋值
        RNNotificationManager.mContext = reactContext;
    }

    @Override
    public String getName() {
        return "RNInterractModule";
    }

    //导出原生端常量
    @Nullable
    @Override
    public Map<String, Object> getConstants() {
        final Map<String,Object> constants = new HashMap<>();
        constants.put(RNEmitter,RNEmitter);
        return constants;
    }

    //==============1、提示==============
    @ReactMethod
    public void showInfo(String info){
        Toast.makeText(getReactApplicationContext(),info,Toast.LENGTH_SHORT).show();
    }

    //==============2、RN回到原生页面==============
    @ReactMethod
    public void popToNative(){
        getCurrentActivity().finish();
    }

    //==============3、RN页面push Native页面==============
    @ReactMethod
    public void pushNative(String activityName){

        if (activityName.equals(RNEmitter)){
            activityName = "com.example.qiu.rntest.reactnative.RNEmitterActivity";
        }

        Class clazz = null;
        try {
            clazz = Class.forName(activityName);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        Intent intent = new Intent(this.mReactContext,clazz).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        this.mReactContext.startActivity(intent);
    }

    //==============4、回调==============
    // 比如调用原生的方法处理图片、视频之类的，处理完成之后再把结果回传到RN页面里去
    //TODO: 请务必注意 callback 并非在对应的原生函数返回后立即被执行——注意跨语言通讯是异步的，这个执行过程会通过消息循环来进行。
    @ReactMethod
    public void patCake(String flour, Callback successCallback,Callback errorCallback){
        try{
            //模拟异常，走reject
            if (!flour.getClass().equals(String.class)){
                throw new Exception("出错了，参数类型不匹配");
            }

            successCallback.invoke(patCakeUse(flour));
        }catch (Exception e){
            errorCallback.invoke(e.getMessage());
        }
    }

    private String patCakeUse(String flour){
        String cake = String.format("使用%s，做好了:\uD83C\uDF82\uD83C\uDF5E\uD83C\uDF5E\uD83C\uDF70\uD83C\uDF70\uD83C\uDF70",flour);
        return cake;
    }

    //==============5、Promise==============
    // 比如调用原生的方法处理图片、视频之类的，处理完成之后再把结果回传到RN页面里去
    @ReactMethod
    public void callNameTointroduction(String name, Promise promise){
        try{
            //模拟异常，走reject
            if (!name.getClass().equals(String.class)){
                throw new Exception("出错了，参数类型不匹配");
            }

            promise.resolve(introduction(name));
        }catch (Exception e){
            promise.reject(e);
        }
    }

    private String introduction(String name){
      return String.format("我的名字叫%s，今年18岁，喜欢运动、听歌...",name);
    }


}
