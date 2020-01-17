package carter.com.example.flutter_demo;

import android.content.Intent;
import android.os.Bundle;
import android.os.PersistableBundle;
import android.util.Log;

import java.util.ArrayList;
import java.util.List;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {

    private static final String TAG = "MainActivity";
    String tag = "MainActivity";
    String  OPEN_WEBVIEW_IN_NEW_PAGE_CHANNEL = "flutter.webview/newpage";
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);
        new MethodChannel(getFlutterView(),OPEN_WEBVIEW_IN_NEW_PAGE_CHANNEL)
                .setMethodCallHandler((methodCall, result) -> {

                    if (methodCall.arguments instanceof List) {
                        for (Object argument : ((List) methodCall.arguments)) {
                            System.out.println(argument);
                        }
                    }

                    if (methodCall.method.equals("openInNewPage")){
                        Intent intent = new Intent(this, WebViewActivity.class);
                        intent.putStringArrayListExtra("pa", (ArrayList<String>) methodCall.arguments);
                        startActivity(intent);
                    }

                    Log.d(TAG, "onCreate: "+methodCall.method+"pa"+methodCall.arguments);
                });

    }

    @Override
    public void onCreate(Bundle savedInstanceState, PersistableBundle persistentState) {
        super.onCreate(savedInstanceState, persistentState);

    }
}
