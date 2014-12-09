package states
{
	import core.Assets;
	import core.Game;
	
	import interfaces.IState;
	
	import objects.IntroBG;
	
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	
	public class MOptions extends Sprite implements IState
	{
		private var xoff:int = 0;
		private var yoff:int = 0;
		private const time:Number = .25;
		private var game:Game;
		private var code:TextField;
		private var bg:IntroBG;
		private var map:Image;
		private var mapTitle:Image;
		private var theArmory:Image;
		private var theRange:Image;
		private var theOracle:Image;
		private var theAmphi:Image;
		private var moptions:Image;
		private var coins:Image;
		private var num:TextField;
		private var mmop:Image;
		private var quit:Button;
		private var returner:Button;
		private var black:Image;
		private var play:Image;
		private var plate:Image;
		private var coder:String;
		
		public function MOptions(game:Game)
		{
			this.game = game;
			addEventListener(Event.ADDED_TO_STAGE,init);
		}
		
		private function init():void
		{
			var gold:int = game.getGold();
			var i0:int = Math.floor(gold/256);
			gold = gold-(256*i0);
			var i1:int =Math.floor(gold/16);
			gold = gold-(16*i1);
			var i2:int =Math.floor(gold);
			var c4:String;
			var c5:String;
			var c6:String;
			switch(i0)
			{
				case 15:
					c4 = "F";
					break;
				case 14:
					c4 = "E";
					break;
				case 13:
					c4 = "D";
					break;
				case 12:
					c4 = "C";
					break;
				case 11:
					c4 = "B";
					break;
				case 10:
					c4 = "A";
					break;
				default:
					c4 = String(i0);
					break;
			}
			switch(i1)
			{
				case 15:
					c5 = "F";
					break;
				case 14:
					c5 = "E";
					break;
				case 13:
					c5 = "D";
					break;
				case 12:
					c5 = "C";
					break;
				case 11:
					c5 = "B";
					break;
				case 10:
					c5 = "A";
					break;
				default:
					c5 = String(i1);
					break;
			}
			switch(i2)
			{
				case 15:
					c6 = "F";
					break;
				case 14:
					c6 = "E";
					break;
				case 13:
					c6 = "D";
					break;
				case 12:
					c6 = "C";
					break;
				case 11:
					c6 = "B";
					break;
				case 10:
					c6 = "A";
					break;
				default:
					c6 = String(i2);
					break;
			}
			var c13:String = game.getStoryLevel();
			
			var c1:String = c13.charAt(0);
			var c2:String = String(game.shootLevel);
			var c3:String = c13.charAt(1);

			coder = String(c1+c2+c3+c4+c5+c6);
			play = new Image(Assets.SBUTexture);
			play.pivotX =  75;
			play.pivotY = 50;
			play.x = 350;
			play.y = 350;
			
			plate = new Image(Assets.TPTexture);
			plate.pivotX =  160;
			plate.pivotY = 100;
			plate.x = 517;
			plate.y = 185;
			
			bg= new IntroBG();
			addChild(bg);
			
			addChild(plate);
			
			addChild(play);
			
			map = new Image(Assets.CMTexture);
			map.x = -10 + xoff;
			map.y = yoff;
			addChild(map);
			
			mapTitle = new Image(Assets.ms.getTexture("mapTitle"));
			mapTitle.x = 38 + xoff;
			mapTitle.y = 41 + yoff;
			addChild(mapTitle);
			
			theArmory = new Image(Assets.ms.getTexture("theArmory"));
			theArmory.x = 71 + xoff;
			theArmory.y = 297+ yoff;
			addChild(theArmory);
			
			theRange = new Image(Assets.ms.getTexture("theRange"));
			theRange.x = 271 + xoff;
			theRange.y = 174+ yoff;
			addChild(theRange);
			
			theOracle = new Image(Assets.ms.getTexture("theOracle"));
			theOracle.x = 430 + xoff;
			theOracle.y = 372+ yoff;
			addChild(theOracle);
			
			theAmphi = new Image(Assets.ms.getTexture("theAmphi"));
			theAmphi.x = 510 + xoff;
			theAmphi.y = 132+ yoff;
			addChild(theAmphi);
			
			
			coins= new Image(Assets.coinTexture);
			coins.x = 625;
			coins.y = -40;
			addChild(coins);
			
			num = new TextField(683,35,String("$ "+game.getGold()),"Assets.Pompeii",20,0x0);
			num.x=683;
			num.y=35;
			num.hAlign = "left";
			addChild(num);
			
			moptions = new Image(Assets.ms.getTexture("mapOptions"));
			moptions.x = 410;
			moptions.y = 56;
			addChild(moptions);
						
			mmop= new Image(Assets.MMopPlateTexture);
//			mmop.x = 625;
			mmop.y = -515;
			addChild(mmop);
			
			quit = new Button(Assets.MMOQuitTexture);
			quit.addEventListener(Event.TRIGGERED, toQuit);
			quit.x = 51;
			quit.y = -181;
			addChild(quit);
			
			returner = new Button(Assets.MMOReturnTexture);
			returner.addEventListener(Event.TRIGGERED, toReturn);
			returner.x = 451;
			returner.y = -181;
			addChild(returner);
			
			code = new TextField(395,65,coder,"Assets.Pompeii",36,0x0);
			code.hAlign = "left";
			code.x = 330;
			code.y = -365;
			addChild(code);
			
			Starling.juggler.tween(code, time, {
				delay: .5,
				y: 150
			});
			
			Starling.juggler.tween(moptions, time, {
				y: -110
			});
			
			Starling.juggler.tween(mmop, time, {
				delay: .5,
				y: 0
			});
			
			Starling.juggler.tween(quit, time, {
				delay: .5,
				y: 334
			});
			
			Starling.juggler.tween(returner, time, {
				delay: .5,
				y: 334
			});
			

		}
		
		private function toReturn():void
		{
			Starling.juggler.tween(code, time, {
				y: -365
			});
			
			Starling.juggler.tween(moptions, time, {
				y: 56
			});
			
			Starling.juggler.tween(mmop, time, {
				y: -515
			});
			
			Starling.juggler.tween(quit, time, {
				y: -181
			});
			
			Starling.juggler.tween(returner, time, {
				y: -181
			});
			
			Starling.juggler.tween(returner, time, {
				delay: .5,
				onComplete: function():void { game.changeState(Game.MMENU); }
			});
		}
		
		private function toQuit():void
		{
			xoff = 800;
			yoff = 800;
			game.menuSwitcher = 1;
			
			Starling.juggler.tween(code, time, {
				y: -365
			});
			
			Starling.juggler.tween(moptions, time, {
				y: 56
			});
			
			Starling.juggler.tween(mmop, time, {
				y: -515
			});
			
			Starling.juggler.tween(quit, time, {
				y: -181
			});
			
			Starling.juggler.tween(returner, time, {
				y: -181
			});
			
			Starling.juggler.tween(num, time, {
				y: -300
			});
			
			Starling.juggler.tween(coins, time, {
				y: -340	
			});
			
			Starling.juggler.tween(mapTitle, time, {
				x: mapTitle.x	-xoff,	
				y: mapTitle.y	-yoff			
			});
			
			Starling.juggler.tween(map, time, {
				x: map.x	-xoff,	
				y: map.y	-yoff			
			});
			
			Starling.juggler.tween(theArmory, time, {
				x: theArmory.x	-xoff,	
				y: theArmory.y	-yoff			
			});
			
			Starling.juggler.tween(theRange, time, {
				x: theRange.x	-xoff,	
				y: theRange.y	-yoff			
			});
			
			Starling.juggler.tween(theOracle, time, {
				x: theOracle.x	-xoff,	
				y: theOracle.y	-yoff			
			});
			
			Starling.juggler.tween(theAmphi, time, {
				x: theAmphi.x	-xoff,	
				y: theAmphi.y	-yoff			
			});
			
			Starling.juggler.tween(moptions, time, {
				x: moptions.x	-xoff,	
				y: moptions.y	-yoff			
			});
			
			Starling.juggler.tween(returner, time, {
				delay: .5,
				onComplete: function():void { game.changeState(Game.INTRO); }
			});
		}
		
		public function update():void
		{
		}
		
		public function destroy():void
		{
			bg.removeFromParent(true);
			bg = null;
			
			map.removeFromParent(true);
			map = null;
			
			mapTitle.removeFromParent(true);
			mapTitle = null;
			
			theArmory.removeFromParent(true);
			theArmory = null;
			
			theRange.removeFromParent(true);
			theRange = null;
			
			theOracle.removeFromParent(true);
			theOracle = null;
			
			theAmphi.removeFromParent(true);
			theAmphi = null;
			
			num.removeFromParent(true);
			num = null;
			
			coins.removeFromParent(true);
			coins = null;
			
			code.removeFromParent(true);
			code = null;
			
			moptions.removeFromParent(true);
			moptions = null;
			
			mmop.removeFromParent(true);
			mmop = null;
			
			quit.removeFromParent(true);
			quit = null;
			
			returner.removeFromParent(true);
			returner = null;
			
			plate.removeFromParent(true);
			plate = null;
			
			play.removeFromParent(true);
			play = null;
		}
	}
}