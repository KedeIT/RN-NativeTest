package com.example.qiu.rntest;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

import com.example.qiu.rntest.reactnative.ReactNativeActivity;
import com.example.qiu.rntest.reactnative.ReactRootViewActivity;

public class MainActivity extends AppCompatActivity implements View.OnClickListener{

    private Button rnButton;
    private EditText editText;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        rnButton = findViewById(R.id.btn_rn);
        rnButton.setOnClickListener(this);

        editText = findViewById(R.id.edit_text);
    }

    @Override
    public void onClick(View view) {
        Intent intent = null;
        switch (view.getId()){
            case R.id.btn_rn:{

                String str = editText.getText().toString().trim();
                if (str.length() == 0){
                    str = "我是Android端传递过来的数据";
                }else{
                    str = "Android端传递数据："+ str;
                }
                intent =  new Intent(MainActivity.this, ReactNativeActivity.class);
                intent.putExtra("msgKey",str);

//                intent = new Intent(MainActivity.this, ReactRootViewActivity.class);
                break;
            }
        }
        startActivity(intent);
    }
}
