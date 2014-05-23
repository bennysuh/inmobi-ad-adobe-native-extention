#introduction#
this is a free adobe native extention (ane) of inmobi ad network for flash air mobile developer.it very easy to use,you can pack your air application or game on pc or mac,with the same code just with as3,and not any java or objective-c need.
1.support all inmobi banner ad sizes and Interstitial<br/>
2.support ads on android and ios(iphone ,ipad ,ipad)<br/>
3.supportlandscape andportrait mode<br/>
4.supportauto Orients air application<br/>
<br/>
###inmobi 1.0.ane
flash air ane lib,contains lib for android and ios all in one file,although there are 4m file size, but it does not increase the final release package size, ease of use.<br/>
###builds###
base on inmobi network ios sdk 4.0.3 and inmobi android sdk 4.0.2<br/>
base on adobe air sdk 3.5,so your app air sdk version must be 3.5 or higher<br/>
ref:http://www.inmobi.com/<br/>
ref:http://labs.adobe.com/<br/>
download:http://code.google.com/p/inmobi-ad-flash-air-ane-ios-android/<br/>
###  extention id
this extention id will been add in application-app.xml<br/>
<extensionID>so.cuo.platform.inmobi</extensionID>
###banner###
how to show a banner ad in air mobile app?
```
if (Inmobi.getInstance().supportDevice)
{
	Inmobi.getInstance().setBannerKeys("app key"); //init inmobi
	Inmobi.getInstance().showBanner(Inmobi.BANNER, InmobiPosition.BOTTOM_CENTER);//show banner with posiction botton_center
}
```
###Interstitial###
1.how to show a Interstitial ad in flash ios or android game?
```
if (Inmobi.getInstance().supportDevice)
{
	Inmobi.getInstance().setBannerKeys("app key"); //init inmobi
	Inmobi.getInstance().addEventListener(InmobiEvent.onInterstitialReceive,onReceiveAd);
	Inmobi.getInstance().cacheInterstitial();//load insterstial ad
}
private function onReceiveAd(event:InmobiEvent):void
{
	Inmobi.getInstance().showInterstitial();//when load success ,display it
}
```
2.also you can do like follow to show inmobi Interstitial
```
Inmobi.getInstance().setBannerKeys("app key"); //init the inmobi
Inmobi.getInstance().cacheInterstitial();//start load interstitial ad
```
After some time
```
if (Inmobi.getInstance().isInterstitialReady())
{//check has load success
	Inmobi.getInstance().showInterstitial();//display ad
}
```
### for android 
for android user,must add inmobi activity to xxx-app.xml
```
<manifest android:installLocation="auto">
     <uses-sdk android:targetSdkVersion="11"/>
     <uses-sdk android:minSdkVersion="8"/>
    <uses-permission android:name="android.permission.INTERNET"/>
    <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
    <application>
    <activity android:name="com.inmobi.androidsdk.IMBrowserActivity" android:configChanges="keyboardHidden|orientation|keyboard|smallestScreenSize|screenSize" android:hardwareAccelerated="true" /> </application>
</manifest>
```
###more
if you enable analyst in www.inmobi.com,you can view your app install info without do any thing<br/>
if you create a app ,and not verify it,or your app not in activity state,you can not load ad,you will get a invalid app id error<br/>
###you may like
[https://code.google.com/p/flash-air-admob-ane-for-ios/ admob ad ane]<br/>
[https://code.google.com/p/chartboost-sdk/ chartboost ad ane]<br/>
----
 contact:qq group£º56892018 email:wohaosea@gmail.com