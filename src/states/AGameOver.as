package states
{
	import core.Assets;
	import core.Game;
	
	import interfaces.IState;
	
	import starling.core.Starling;
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	import starling.display.DisplayObject;
	
	public class AGameOver extends Sprite implements IState
	{
		private const offset:int = 522;
		private var game:Game;
		private var bg:Image;
		private var plate:Image;
		private var again:Button;
		private var returner:Button;
		private var score:TextField;
		private var num:TextField;
		private var earned:int;
		
		public function AGameOver(game:Game)
		{
			this.game = game;
			addEventListener(Event.ADDED_TO_STAGE,init);
		}
		
		private function init():void
		{
			earned= Math.floor(game.getScore()/100)
			bg = new Image(Assets.RangeBGTexture);
			addChild(bg);
			
			plate = new Image(Assets.AGMPlateTexture);
			plate.x =132;
			plate.y= 20 - offset;
			addChild(plate);
			
			again = new Button(Assets.AGMAgainTexture);
			again.x= 138;
			again.y= 322- offset;
			again.addEventListener(Event.TRIGGERED, toMenu);
			addChild(again);
			
			returner = new Button(Assets.AGMReturnTexture);
			returner.addEventListener(Event.TRIGGERED, toMain);
			returner.x= 444;
			returner.y= 322- offset;
			addChild(returner);
			
			score = new TextField(201,56,String(game.getScore()),"Assets.Pompeii",30,0x0);
			score.x=367;
			score.y=134- offset;
			score.hAlign = "center";
			addChild(score);
			
			num = new TextField(193,56,String(earned),"Assets.Pompeii",30,0x0);
			num.x=315;
			num.y=208- offset;
			num.hAlign = "center";
			addChild(num);
			
			game.addGold(earned);
			
			Starling.juggler.tween(plate, .25, {
				y:	20
			});
			
			Starling.juggler.tween(again, .25, {
				y:	322
			});
			
			Starling.juggler.tween(returner, .25, {
				y:	322
			});
			
			Starling.juggler.tween(score, .25, {
				y:	134
			});
			
			Starling.juggler.tween(num, .25, {
				y:	208
			});
		}
		
		private function toMain():void
		{
			fadeOut();
			Starling.juggler.tween(bg, .45, {
				alpha:0,
				onComplete: function():void { game.changeState(Game.MMENU); }
			});			
		}
		
		private function toMenu():void
		{
			fadeOut();
			Starling.juggler.tween(bg, .45, {
				alpha:0,
				onComplete: function():void { game.changeState(Game.AMENU); }
			});				
		}
		
		private function fadeOut():void
		{
			Starling.juggler.tween(plate, .25, {
				alpha:0
			});
			
			Starling.juggler.tween(again, .25, {
				alpha:0
			});
			
			Starling.juggler.tween(returner, .25, {
				alpha:0
			});
			
			Starling.juggler.tween(num, .25, {
				alpha:0
			});
			
			Starling.juggler.tween(score, .25, {
				alpha:0
			});
		}
		public function update():void
		{
		}
		
		public function destroy():void
		{
			bg.removeFromParent(true);
			bg = null;
			
			again.removeFromParent(true);
			again = null;
			
			plate.removeFromParent(true);
			plate = null;
			
			returner.removeFromParent(true);
			returner = null;
			
			num.removeFromParent(true);
			num = null;
			
			score.removeFromParent(true);
			score = null;
		}
	}
}