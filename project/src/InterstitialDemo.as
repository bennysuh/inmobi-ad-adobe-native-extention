package
{
	import flash.display.Sprite;
	
	import so.cuo.platform.inmobi.Inmobi;
	import so.cuo.platform.inmobi.InmobiEvent;
	import so.cuo.platform.inmobi.InmobiPosition;
	/*
	for android you need add this activity in xxx-app.xml
	
	<activity android:name="com.inmobi.androidsdk.IMBrowserActivity"
	android:configChanges="keyboardHidden|orientation|keyboard|smallestScreenSize|screenSize"
	android:hardwareAccelerated="true" />
	*/
	public class InterstitialDemo extends Sprite
	{
		public function InterstitialDemo()
		{
			super();
			showAd();
		}
		function showAd():String
		{
			if (Inmobi.getInstance().supportDevice)
			{
				Inmobi.getInstance().setBannerKeys("app key"); //
				Inmobi.getInstance().addEventListener(InmobiEvent.onInterstitialReceive,onReceiveAd);
				Inmobi.getInstance().cacheInterstitial();
			}
		}

		private function onReceiveAd(event:InmobiEvent):void
		{
			Inmobi.getInstance().showInterstitial();
		}
	}
}