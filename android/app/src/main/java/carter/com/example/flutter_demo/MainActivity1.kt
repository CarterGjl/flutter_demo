package carter.com.example.flutter_demo

import android.os.Bundle
import android.util.Log
import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity1 : FlutterActivity() {

    val tag = "MainActivity"
    internal val OPEN_WEBVIEW_IN_NEW_PAGE_CHANNEL = "flutter.webview/newpage"
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(this)
//        MethodChannel(flutterView,OPEN_WEBVIEW_IN_NEW_PAGE_CHANNEL)
//                .setMethodCallHandler{
//
//                    call,result->
//
//                    Log.d(tag,"call $call, result $result")
//                    if (call.method == "openInNewPage") {
//                        result.success("open the url in new page")
//                    }
//                }
    }
}
