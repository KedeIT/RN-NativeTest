package com.example.qiu.rntest;

import android.app.Application;

import com.example.qiu.rntest.reactnative.RNInterractPackage;
import com.facebook.react.ReactApplication;
import com.facebook.react.ReactNativeHost;
import com.facebook.react.ReactPackage;
import com.facebook.react.shell.MainReactPackage;

import java.util.Arrays;
import java.util.List;

public class MainApplication extends Application implements ReactApplication{
    @Override
    public ReactNativeHost getReactNativeHost() {
        return reactNativeHost;
    }


    private ReactNativeHost reactNativeHost = new ReactNativeHost(this) {
        @Override
        public boolean getUseDeveloperSupport() {
            return true;
        }

        @Override
        protected List<ReactPackage> getPackages() {
            return Arrays.<ReactPackage>asList(
                    new MainReactPackage(),
                    new RNInterractPackage()
            );
        }

        @Override
        protected String getJSMainModuleName() {
            return "index";
        }
    };
}
