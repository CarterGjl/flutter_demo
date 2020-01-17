package carter.com.example.flutter_demo;

import android.os.Build;
import android.os.Bundle;
import android.webkit.PermissionRequest;
import android.webkit.WebChromeClient;
import android.webkit.WebResourceRequest;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

import java.util.ArrayList;
import java.util.Arrays;

public class WebViewActivity extends AppCompatActivity {
    private TextView mTvTest;
    private ArrayList<String> mListExtra;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.webivew_activity);

        mTvTest = findViewById(R.id.tv_test);

        mListExtra = getIntent().getStringArrayListExtra("pa");
        mTvTest.setText(Arrays.toString(mListExtra.toArray()));
        initView();
    }


    private WebView mWv;

    private static final String TAG = "MainActivity";

    private void initView() {

        mWv = findViewById(R.id.wv);

        WebSettings webSettings = mWv.getSettings();
        webSettings.setJavaScriptEnabled(true);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR1) {
            webSettings.setMediaPlaybackRequiresUserGesture(false);
        }
        webSettings.setLoadWithOverviewMode(true);
        webSettings.setUseWideViewPort(true);
        webSettings.setDomStorageEnabled(true);
        mWv.setWebViewClient(new WebViewClient(){

            @Override
            public boolean shouldOverrideUrlLoading(WebView view, String url) {
//                Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse(url));
//                startActivity(intent);
                return false;
            }

            @Override
            public boolean shouldOverrideUrlLoading(WebView view, WebResourceRequest request) {
                return super.shouldOverrideUrlLoading(view, request);
            }


        });

        mWv.setWebChromeClient(new WebChromeClient(){

            @Override
            public void onPermissionRequest(final PermissionRequest request) {

                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
                    request.grant(request.getResources());
                }
            }



        });
//        mWv.loadUrl("https://v2demo.mediasoup.org/?roomId=a0kwjond");
        mWv.loadUrl(mListExtra.get(0));
//        mWv.loadUrl("https://www.baidu.com");
    }
}
