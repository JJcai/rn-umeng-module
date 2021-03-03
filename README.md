
# rn-umeng-module

[![npm version](http://img.shields.io/npm/v/rn-umeng-module.svg?style=flat-square)](https://npmjs.org/package/rn-umeng-module "View this project on npm")
[![npm version](http://img.shields.io/npm/dm/rn-umeng-module.svg?style=flat-square)](https://npmjs.org/package/rn-umeng-module "View this project on npm")

umeng for react-native,支持统计、分享、授权

## 安装

> `$ npm install rn-umeng-module --save`

* react-native <0.60

> `$ react-native link rn-umeng-module`

* react-native >=0.60

新版RN会自动link,不需要执行link命令

---
不管是哪个版本的react-native，ios端都需要在`ios`文件夹下执行
```shell
$ cd ios
$ pod install
```


### 配置
为了防止包的体积太大，该库里面不包含任何第三方平台的分享库(umeng相关的库已添加，不必在重复添加)，需要按需集成
#### iOS
* 1.配置分享库(按需集成)
  打开`Podfile`文件，按需添加需要的分享平台库
  ```
    # 集成微信(完整版14.4M)
    pod 'UMShare/Social/WeChat'

    # 集成QQ/QZone/TIM(完整版7.6M)
    pod 'UMShare/Social/QQ'  

    # 集成QQ/QZone/TIM(精简版0.5M)
    pod 'UMShare/Social/ReducedQQ'

    # 集成新浪微博(完整版25.3M)
    pod 'UMShare/Social/Sina' 

    # 集成新浪微博(精简版1M)
    pod 'UMShare/Social/ReducedSina'

    # 集成钉钉
    pod 'UMShare/Social/DingDing'

    # 企业微信
    pod 'UMShare/Social/WeChatWork'

    # 抖音
    pod 'UMShare/Social/DouYin'

    # 集成支付宝
    pod 'UMShare/Social/AlipayShare'

    # 集成邮件
    pod 'UMShare/Social/Email'

    # 集成短信
    pod 'UMShare/Social/SMS'

    # 集成有道云笔记
    pod 'UMShare/Social/YouDao'

    # 集成印象笔记
    pod 'UMShare/Social/EverNote'

    # 集成易信
    pod 'UMShare/Social/YiXin'

    # 集成Facebook/Messenger
    pod 'UMShare/Social/Facebook'

    # 集成Twitter
    pod 'UMShare/Social/Twitter'

    # 集成Flickr
    pod 'UMShare/Social/Flickr'

    # 集成Kakao
    pod 'UMShare/Social/Kakao'

    # 集成Tumblr
    pod 'UMShare/Social/Tumblr'

    # 集成Pinterest
    pod 'UMShare/Social/Pinterest'

    # 集成Instagram
    pod 'UMShare/Social/Instagram'

    # 集成Line
    pod 'UMShare/Social/Line'

    # 集成WhatsApp
    pod 'UMShare/Social/WhatsApp'

    # 集成Google+
    pod 'UMShare/Social/GooglePlus'

    # 集成Pocket
    pod 'UMShare/Social/Pocket'

    # 集成DropBox
    pod 'UMShare/Social/DropBox'

    # 集成VKontakte
    pod 'UMShare/Social/VKontakte'
  ```
* 2.初始化

```
#import "RNUMConfigure.h"

-(BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  ...
  //打开调试模式
  //[UMConfigure setLogEnabled:YES];
  //初始化umeng，会自动读取info.plist中的参数
  [RNUMConfigure initWithAppkey:@"599d6d81c62dca07c5001db6" channel:@"App Store"];
	return YES;
}
```

* 3.第三方平台配置，点击[跳转](https://developer.umeng.com/docs/128606/detail/193653#h1-u7B2Cu4E09u65B9u5E73u53F0u914Du7F6E4)
  查看umeng官方的配置教程

#### Android
* 1.配置分享库(按需集成)

打开`app/build.gradle`,按需添加分享库()
```javascript
//QQ
implementation  'com.umeng.umsdk:share-qq:7.1.4'
implementation  'com.tencent.tauth:qqopensdk:3.51.2' //QQ官方SDK依赖库    

//微信
implementation  'com.umeng.umsdk:share-wx:7.1.4'
implementation  'com.tencent.mm.opensdk:wechat-sdk-android-without-mta:6.6.5'//微信官方SDK依赖库

//新浪微博        
implementation  'com.umeng.umsdk:share-sina:7.1.4'
implementation  'com.sina.weibo.sdk:core:10.10.0:openDefaultRelease@aar'//新浪微博官方SDK依赖库

//支付宝
implementation  'com.umeng.umsdk:share-alipay:7.1.4'

//钉钉
implementation  'com.umeng.umsdk:share-dingding:7.1.4'
```

* 2.配置sdk的仓库地址

打开project的build.gradle文件中添加
```javascript
buildscript {
  repositories {
    google()
    jcenter()
    maven { url 'https://dl.bintray.com/umsdk/release' }
    maven { url "https://dl.bintray.com/thelasterstar/maven/" }
    ....
  }
}
allprojects {
    repositories {
        //umeng的仓库地址
        maven { url 'https://dl.bintray.com/umsdk/release' }
        //sina的仓库地址
        maven { url "https://dl.bintray.com/thelasterstar/maven/" }
        ....
    }
}
```


* 3.在`包名`目录下创建wxapi文件夹，wxapi下面创建`WXEntryActivity.java`文件
```Java
package [你的包名].wxapi;

import com.umeng.socialize.weixin.view.WXCallbackActivity;

public class WXEntryActivity extends WXCallbackActivity {


}
```

<font color="red">QQ、微博:</font> 在当前的7.1.4版本中，已经不需要添加回调activity文件了

<font color="red">支付宝:</font> 在`包名`目录下创建`apshare`文件夹,然后建立一个`ShareEntryActivity`的类，
继承`ShareCallbackActivity`。

<font color="red">钉钉:</font> 在`包名`目录下创建`ddshare`文件夹,然后建立一个`DDShareActivity`的类，
继承`DingCallBack`。



* 4.在res/xml目录(如果没有xml目录，则新建一个)下,创建``文件
  (如果已经存在，则按照下面代码添加缺失的部分即可)file_paths.xml
  
```xml
<?xml version="1.0" encoding="utf-8"?>
<paths xmlns:android="http://schemas.android.com/apk/res/android">
    <!-- QQ 官方分享SDK 共享路径 -->
    <root-path name="opensdk_root" path=""/>
    <external-files-path name="opensdk_external" path="Images/tmp"/>
    <!-- 友盟微信分享SDK 共享路径 -->
    <external-files-path name="umeng_cache" path="umeng_cache/"/>
    <!-- 新浪微博 官方分享SDK 10.10.0共享路径 -->
    <external-files-path name="share_files" path="." />
</paths>
```

* 5.在`AndroidManifest.xml`清单文件中增加

微信、支付宝、钉钉的回调类
```xml
<!--微信的分享回调类-->
<activity
    android:name=".wxapi.WXEntryActivity"
    android:configChanges="keyboardHidden|orientation|screenSize"
    android:exported="true"
    android:theme="@android:style/Theme.Translucent.NoTitleBar" />
<!--支付宝的分享回调类-->
<activity
    android:name=".apshare.ShareEntryActivity"
    android:configChanges="keyboardHidden|orientation|screenSize"
    android:exported="true"
    android:screenOrientation="portrait"
    android:theme="@android:style/Theme.Translucent.NoTitleBar" />
<!--钉钉的分享回调类-->
<activity
    android:name=".ddshare.DingCallBack"
    android:configChanges="keyboardHidden|orientation|screenSize"
    android:exported="true"
    android:screenOrientation="portrait"
    android:theme="@android:style/Theme.Translucent.NoTitleBar" />
```


```xml
<!-- Android 7.0 文件共享配置，必须配置 -->
<provider
    android:name="androidx.core.content.FileProvider"
    android:authorities="${applicationId}.fileprovider"
    android:exported="false"
    android:grantUriPermissions="true">
  <meta-data
          android:name="android.support.FILE_PROVIDER_PATHS"
          android:resource="@xml/file_paths" />
</provider>
```

~~请注意将我们的qq appkey替换成您自己的qq appkey。~~ (在最新的qq sdk里面已经包含了这个，只需要设置~~请注意将我们的qq appkey替换成您自己的qq appkey。~~(在最新的qq sdk里面已经包含了这个，只需要设置)
即可)
需要设置`compileSdkVersion = 29`
```xml
<!--QQ的回调类-->
<activity
    android:name="com.tencent.tauth.AuthActivity"
    android:launchMode="singleTask"
    android:noHistory="true" >
    <intent-filter>
        <action android:name="android.intent.action.VIEW" />
        <category android:name="android.intent.category.DEFAULT" />
        <category android:name="android.intent.category.BROWSABLE" />
        <!-- 这里替换qq的appKey -->
        <data android:scheme="tencent100424468" />
    </intent-filter>
</activity>
<activity
    android:name="com.tencent.connect.common.AssistActivity"
    android:theme="@android:style/Theme.Translucent.NoTitleBar"
    android:configChanges="orientation|keyboardHidden|screenSize"/>
```
<font color="red">上面针对QQ的均不用设置，新版本sdk中已经内置，只需要在`app/buid.gradle`中设置
```javascript
defaultConfig {
    ...
    manifestPlaceholders= [
        qqappid: '你的QQ的appId'
    ]
    ...
}
```

* 6.在`Application`文件的`onCreate()`中进行初始化

```Javascript

 @Override
  public void onCreate() {
      super.onCreate();
      SoLoader.init(this, /* native exopackage */ false);
      RNUMConfigure.init(this, "59892f08310c9307b60023d0", "Umeng", UMConfigure.DEVICE_TYPE_PHONE, "");
      PlatformConfig.setWeixin("wxdc1e388c3822c80b", "3baf1193c85774b3fd9d18447d76cab0");
      //豆瓣RENREN平台目前只能在服务器端配置
      PlatformConfig.setSinaWeibo("3921700954", "04b48b094faeb16683c32669824ebdad", "http://sns.whalecloud.com");
      PlatformConfig.setYixin("yxc0614e80c9304c11b0391514d09f13bf");
      PlatformConfig.setQQZone("100424468", "c7394704798a158208a74ab60104f0ba");
  }
```
  
`RNUMConfture.init`接口一共五个参数，其中第一个参数为`Context`，
第二个参数为友盟`Appkey`，第三个参数为`channel`，第四个参数为应用类型（手机或平板），
第五个参数为push的`secret`（如果没有使用push，可以为空）。

在`MainActivity`中进行初始化和回调
```Javascript
    @Override
    protected void onCreate(Bundle savedInstanceState) {
      super.onCreate(savedInstanceState);
      RNShareModule.initSocialSDK(this);
    }

    @Override
    public void onActivityResult(int requestCode, int resultCode, Intent data) {
      super.onActivityResult(requestCode, resultCode, data);
      UMShareAPI.get(this).onActivityResult(requestCode, resultCode, data);
    }
```

## 使用
```javascript
import {AnalyticsUtil, PushUtil, ShareUtil} from 'rn-umeng-module';

```

具体方法请查看: [index.d.ts](./index.d.ts)


## 注意事项&&疑问

#### 1.无法使用?

请升级到最新版本后再试

目前对于React Native不用区分版本，直接使用最新版即可,只是安装方式略有不同

#### 2.<font color='red'>集成后全量更新无效果</font>

请确定targetSDKVersion是否为28或者以上，bugly请求由于使用了http，而android 9默认是不支持http请求的，需要调整下

具体请参考:

https://blog.csdn.net/weixin_34114823/article/details/88037177

#### 3.为什么我点击更新按钮后，对话框关闭，啥反应都没有?

等一会会出现安装提示,bugly对的更新方式是直接在通知栏显示下载进度，下载完成覆盖安装，如果状态栏没有提示，那就是没有通知权限(oppo/vivo系统是默认不开启该权限的)



#### 4.其他问题可在官方项目中查找答案

https://github.com/BuglyDevTeam/Bugly-Android-Demo
  
## 截图

<img src='https://tva1.sinaimg.cn/large/007S8ZIlgy1gdpp54zj0nj30u01uoqed.jpg' />
<img src='https://tva1.sinaimg.cn/large/007S8ZIlgy1gdpp5gjhhvj30u01uotej.jpg' />
