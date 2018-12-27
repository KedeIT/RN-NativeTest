package com.example.qiu.rntest.reactnative;

import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.Button;

import com.example.qiu.rntest.R;
import com.facebook.react.bridge.Arguments;
import com.facebook.react.bridge.WritableMap;

public class RNEmitterActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_rnemitter);
        setTitle("RNEmitter");

        Button button = findViewById(R.id.btn_sendmessage);
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                WritableMap params = Arguments.createMap();
                params.putString("message","登录成功");
                RNNotificationManager.sendRNEvent("kRNNotification_Login",params);
            }
        });

    }
}
