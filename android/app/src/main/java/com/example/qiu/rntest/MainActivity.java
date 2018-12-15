package com.example.qiu.rntest;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import com.example.qiu.rntest.reactnative.ReactNativeActivity;
import com.example.qiu.rntest.reactnative.ReactRootViewActivity;

public class MainActivity extends AppCompatActivity implements View.OnClickListener{

    private Button mRNButton;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        mRNButton = findViewById(R.id.btn_rn);
        mRNButton.setOnClickListener(this);
    }

    @Override
    public void onClick(View view) {
        Intent intent = null;
        switch (view.getId()){
            case R.id.btn_rn:{
                intent =  new Intent(MainActivity.this, ReactNativeActivity.class);
//                intent = new Intent(MainActivity.this, ReactRootViewActivity.class);
                break;
            }
        }
        startActivity(intent);
    }
}
