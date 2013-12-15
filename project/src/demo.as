package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.system.Capabilities;
	import flash.text.TextField;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	
	import so.cuo.platform.inmobi.Inmobi;
	import so.cuo.platform.inmobi.InmobiEvent;
	import so.cuo.platform.inmobi.InmobiSize;
	/*
	for android you need add this activity in xxx-app.xml
	
	<activity android:name="com.inmobi.androidsdk.IMBrowserActivity"
	android:configChanges="keyboardHidden|orientation|keyboard|smallestScreenSize|screenSize"
	android:hardwareAccelerated="true" />
	*/
	public class demo extends Sprite
	{
		public var xkey:TextField=new TextField();
		public var ykey:TextField=new TextField();
		public var typekey:TextField=new TextField();
		public var absSubmitButton:TextField=new TextField();
		public var relationSubmitButton:TextField=new TextField();
		public var hideSubmitButton:TextField=new TextField();
		public var interstitialSubmitButton:TextField=new TextField();
		private var format:TextFormat=new TextFormat(null, 38);
		private var inmobi:Inmobi;

		protected function getAppID():String{
			return Capabilities.manufacturer.indexOf("iOS")>-1?"ios app id":"android app id";
		}
		public function demo()
		{
			super();
			stage.align=StageAlign.TOP_LEFT;
			stage.scaleMode=StageScaleMode.NO_SCALE;
			initUI();
			inmobi=Inmobi.getInstance();
			if (inmobi.supportDevice)
			{
				inmobi.setBannerKeys(this.getAppID());
				inmobi.addEventListener(InmobiEvent.onInterstitialReceive, onAdReceived);
				inmobi.addEventListener(InmobiEvent.onBannerReceive, onAdReceived);
			}
		}

		private function initUI():void
		{
			typekey.y=ykey.y=xkey.y=100;
			xkey.x=100;
			ykey.x=300;
			typekey.x=500;
			typekey.type=ykey.type=xkey.type=TextFieldType.INPUT;
			typekey.border=xkey.border=ykey.border=true;
			this.hideSubmitButton.width=relationSubmitButton.width=interstitialSubmitButton.width=absSubmitButton.width=xkey.width=ykey.width=140;
			this.typekey.height=this.hideSubmitButton.height=relationSubmitButton.height=interstitialSubmitButton.height=absSubmitButton.height=xkey.height=ykey.height=48;
			this.typekey.defaultTextFormat=this.hideSubmitButton.defaultTextFormat=interstitialSubmitButton.defaultTextFormat=relationSubmitButton.defaultTextFormat=absSubmitButton.defaultTextFormat=xkey.
				defaultTextFormat=ykey.defaultTextFormat=this.format;
			absSubmitButton.text="absolute";
			relationSubmitButton.text="relation";
			interstitialSubmitButton.text="interstitial";
			this.hideSubmitButton.text="hide";
			xkey.text="8"; // relation position type or abs position x value
			ykey.text="0"; //abs position y value
			typekey.text="1"; // banner type
			this.addChild(xkey);
			this.addChild(ykey);
			this.addChild(this.typekey);
			this.addChild(absSubmitButton);
			this.addChild(this.relationSubmitButton);
			this.addChild(this.interstitialSubmitButton);
			this.addChild(this.hideSubmitButton);
			this.hideSubmitButton.x=relationSubmitButton.x=interstitialSubmitButton.x=absSubmitButton.x=100;
			this.relationSubmitButton.selectable=this.absSubmitButton.selectable=this.interstitialSubmitButton.selectable=false;
			this.relationSubmitButton.border=this.absSubmitButton.border=this.interstitialSubmitButton.border=true;
			this.relationSubmitButton.y=200;
			this.absSubmitButton.y=300;
			this.interstitialSubmitButton.y=400;
			this.hideSubmitButton.y=500;
			absSubmitButton.addEventListener(MouseEvent.CLICK, this.click);
			relationSubmitButton.addEventListener(MouseEvent.CLICK, this.click);
			interstitialSubmitButton.addEventListener(MouseEvent.CLICK, this.click);
			this.hideSubmitButton.addEventListener(MouseEvent.CLICK, this.click);
		}

		protected function click(event:MouseEvent):void
		{
			if (!inmobi.supportDevice)
			{
				trace("notbb d  support device");
				return
			}
			else
			{
				var text:TextField=event.currentTarget as TextField;
				var xv:int=parseInt(xkey.text);
				var yv:int=parseInt(ykey.text);
				var size:int=parseInt(typekey.text);
				var adsize:InmobiSize;
				if (size == 1)
				{
					adsize=Inmobi.BANNER;
				}
				if (size == 2)
				{
					adsize=Inmobi.IPAD_BANNER;
				}
				if (size == 3)
				{
					adsize=Inmobi.IAB_MRECT;
				}
				if (size == 4)
				{
					adsize=Inmobi.IPAD_LEADERBOARD;
				}
				if (size == 5)
				{
					adsize=Inmobi.TABLE_LANDSCAPE;
				}
				if (adsize == null)
				{
					adsize=new InmobiSize(320, 50);
				}
				trace(" 2set size:",adsize.width,adsize.height);
				if (text == this.hideSubmitButton)
				{
					inmobi.hideBanner();
				}
				if (text == this.absSubmitButton)
				{
					inmobi.showBannerAbsolute(adsize, xv, yv);
				}
				else if (text == this.relationSubmitButton)
				{
					if (xv > 9)
						xv=9;
					if (xv < 1)
						xv=1;
					inmobi.showBanner(adsize, xv);
				}
				else if (text == this.interstitialSubmitButton)
				{
					if (inmobi.isInterstitialReady())
					{
//						trace("flash showInterstitial");
						inmobi.hideBanner();
						inmobi.showInterstitial();
					}
					else
					{
//						trace("flash cacheInterstial");
						inmobi.cacheInterstitial();
					}
				}
			}
		}

		protected function onBannerFail(event:Event):void
		{
			trace(event.type);
		}

		protected function onAdReceived(event:Event):void
		{
			trace(event.type);
		}
	}
}
