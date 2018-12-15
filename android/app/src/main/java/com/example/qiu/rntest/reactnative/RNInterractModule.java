package com.example.qiu.rntest.reactnative;

import android.widget.Toast;

import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Nullable;

public class RNInterractModule extends ReactContextBaseJavaModule {

    private ReactContext mReactContext;

    public RNInterractModule(ReactApplicationContext reactContext) {
        super(reactContext);
        this.mReactContext = reactContext;
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
        constants.put("RNEmitter","RNEmitter");
        return constants;
    }

    //提示
    @ReactMethod
    public void showInfo(String info){
        Toast.makeText(getReactApplicationContext(),info,Toast.LENGTH_SHORT).show();
    }
    //RN回到原生页面
    @ReactMethod
    public void popToNative(){
        Toast.makeText(getReactApplicationContext(),"RN回到原生页面",Toast.LENGTH_SHORT).show();
    }
    //RN页面push Native页面
    @ReactMethod
    public void pushNative(String activityName){
        Toast.makeText(getReactApplicationContext(),activityName,Toast.LENGTH_SHORT).show();
    }

}
