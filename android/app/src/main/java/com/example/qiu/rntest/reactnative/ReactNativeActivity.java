package com.example.qiu.rntest.reactnative;

import android.app.Activity;
import android.os.Bundle;

import com.facebook.react.ReactActivity;
import com.facebook.react.ReactActivityDelegate;

import javax.annotation.Nullable;

public class ReactNativeActivity extends ReactActivity {

    @Nullable
    @Override
    protected String getMainComponentName() {
        return "RNTest";
    }

    @Override
    protected ReactActivityDelegate createReactActivityDelegate() {
        return new CustomDelegate(this,getMainComponentName());
    }

    //自定义ReactDelegate
    class CustomDelegate extends ReactActivityDelegate {

        private CustomDelegate(Activity activity, @Nullable String mainComponentName) {
            super(activity, mainComponentName);
        }

        @Nullable
        @Override
        protected Bundle getLaunchOptions() {
            Bundle bundle = new Bundle();
            bundle.putString("msg","我是Android端传递过来的数据");
            return bundle;
        }
    }
}
