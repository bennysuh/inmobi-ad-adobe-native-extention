package
{
	import flash.display.Sprite;
	import flash.system.Capabilities;
	import so.cuo.platform.inmobi.Inmobi;
	import so.cuo.platform.inmobi.InmobiPosition;

	/*
	for android you need add this activity in xxx-app.xml

	<activity android:name="com.inmobi.androidsdk.IMBrowserActivity"
	android:configChanges="keyboardHidden|orientation|keyboard|smallestScreenSize|screenSize"
	android:hardwareAccelerated="true" />
*/
	public class BannerDemo extends Sprite
	{
		public function BannerDemo()
		{
			super();
			this.showAd();
		}

		function showAd():String
		{
			if (Inmobi.getInstance().supportDevice)
			{
				Inmobi.getInstance().setBannerKeys("app key"); //
				Inmobi.getInstance().showBanner(Inmobi.BANNER, InmobiPosition.BOTTOM_CENTER);
			}
		}
	}
}
