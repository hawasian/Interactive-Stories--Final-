package states
{
	import core.Assets;
	import core.Game;
	
	import interfaces.IState;
	
	import objects.IntroBG;
	
	import starling.core.Starling;
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;

	public class MMenu extends Sprite implements IState
	{
		private var xoff:int = -800;
		private var yoff:int = -800;
		private var coff:int = 300;
		private const time:Number = .25;
		private var game:Game;
		private var code:TextField;
		private var bg:IntroBG;
		private var map:Image;
		private var mapTitle:Image;
		private var theArmory:Button;
		private var theRange:Button;
		private var theOracle:Button;
		private var theAmphi:Button;
		private var moptions:Button;
		private var coins:Image;
		private var num:TextField;

		
		public function MMenu(game:Game)
		{
			this.game = game;
			addEventListener(Event.ADDED_TO_STAGE,init);
		}
		
		private function init():void
		{
			if(game.menuSwitcher == 0)
			{
				xoff = 0;
				yoff = 0;
				coff=0;
				game.menuSwitcher = 1;
			}
			bg= new IntroBG();
			addChild(bg);
			
			map = new Image(Assets.CMTexture);
			map.x = -10 + xoff;
			map.y = yoff;
			addChild(map);
			
			mapTitle = new Image(Assets.ms.getTexture("mapTitle"));
			mapTitle.x = 38 + xoff;
			mapTitle.y = 41 + yoff;
			addChild(mapTitle);
			
			theArmory = new Button(Assets.ms.getTexture("theArmory"));
			theArmory.addEventListener(Event.TRIGGERED, toArms);
			theArmory.x = 71 + xoff;
			theArmory.y = 297+ yoff;
			addChild(theArmory);
			
			theRange = new Button(Assets.ms.getTexture("theRange"));
			theRange.addEventListener(Event.TRIGGERED, toRange);
			theRange.x = 271 + xoff;
			theRange.y = 174+ yoff;
			addChild(theRange);
			
			theOracle = new Button(Assets.ms.getTexture("theOracle"));
			theOracle.addEventListener(Event.TRIGGERED, toOracle);
			theOracle.x = 430 + xoff;
			theOracle.y = 372+ yoff;
			addChild(theOracle);
			
			theAmphi = new Button(Assets.ms.getTexture("theAmphi"));
			theAmphi.addEventListener(Event.TRIGGERED, toAmphi);
			theAmphi.x = 510 + xoff;
			theAmphi.y = 132+ yoff;
			addChild(theAmphi);
			
			moptions = new Button(Assets.ms.getTexture("mapOptions"));
			moptions.addEventListener(Event.TRIGGERED, toMOptions);
			moptions.x = 410 + xoff;
			moptions.y = 56+ yoff;
			addChild(moptions);
			
			coins= new Image(Assets.coinTexture);
			coins.x = 625;
			coins.y = -40-coff;
			addChild(coins);
			
			num = new TextField(683,35,String("$ "+game.getGold()),"Assets.Pompeii",20,0x0);
			num.x=683;
			num.y=35-coff;
			num.hAlign = "left";
			addChild(num);
			
			Starling.juggler.tween(num, time, {
				y: 35
			});
			
			Starling.juggler.tween(coins, time, {
				y: -40	
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
			
		}
		
		private function toMOptions():void
		{
			game.menuSwitcher = 0;
			game.changeState(Game.MMOPT);
		}
		
		private function toAmphi():void
		{
			fadeOut();
			Starling.juggler.tween(bg, time, {
				onComplete: function():void { game.changeState(Game.SMENU); }
			});

		}
		
		private function toOracle():void
		{	
			fadeOut();
			Starling.juggler.tween(bg, time, {
				onComplete: function():void { game.changeState(Game.QMENU); }
			});
		}
		
		private function toRange():void
		{		
			fadeOut();
			Starling.juggler.tween(bg, time, {
				onComplete: function():void { game.changeState(Game.AMENU); }
			});
		}
		
		private function toArms():void
		{
			fadeOut();
			Starling.juggler.tween(bg, time, {
				onComplete: function():void { game.changeState(Game.STORE); }
			});
		}
		
		private function fadeOut():void
		{
			Starling.juggler.tween(theAmphi, time, {
				alpha: 0
			});	
				
			Starling.juggler.tween(theOracle, time, {
				alpha: 0
			});
				
			Starling.juggler.tween(theRange, time, {
				alpha: 0
			});
			
			Starling.juggler.tween(theArmory, time, {
				alpha: 0
			});
			
			Starling.juggler.tween(map, time, {
				alpha: 0
			});
			
			Starling.juggler.tween(mapTitle, time, {
				alpha: 0
			});
			
			Starling.juggler.tween(coins, time, {
				alpha: 0
			});
			
			Starling.juggler.tween(num, time, {
				alpha: 0
			});
			
			Starling.juggler.tween(moptions, time, {
				alpha: 0
			});
			
			Starling.juggler.tween(bg, time, {
				alpha: 0
			});
		}
		
		public function update():void
		{
			num.text = String("$ "+game.getGold());
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
			
			moptions.removeFromParent(true);
			moptions = null;
			
			num.removeFromParent(true);
			num = null;
			
			coins.removeFromParent(true);
			coins = null;
		}
	}
}