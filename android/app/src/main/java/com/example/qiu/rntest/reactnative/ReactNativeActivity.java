package com.example.qiu.rntest.reactnative;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.util.Log;

import com.facebook.react.ReactActivity;
import com.facebook.react.ReactActivityDelegate;

import javax.annotation.Nullable;

public class ReactNativeActivity extends ReactActivity {

    private String strData;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        Intent intent = getIntent();
        if (intent != null){
            strData = intent.getStringExtra("msgKey");
        }
        super.onCreate(savedInstanceState);
    }

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
            bundle.putString("msg",strData);
            return bundle;
        }
    }
}
