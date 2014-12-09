package states
{
	import core.Assets;
	import core.Game;
	
	import interfaces.IState;
	
	import objects.IntroBG;
	
	import starling.animation.Transitions;
	import starling.animation.Tween;
	import starling.core.Starling;
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class TMenu extends Sprite implements IState
	{
		private var game:Game;
		private var bg:IntroBG;
		private var mmb:Image;
		private var mmnew:Button;
		private var mmload:Button;
		private var mmc:Button;
		
		public function TMenu(game:Game)
		{
			this.game = game;
			addEventListener(Event.ADDED_TO_STAGE,init);
		}
		
		private function init():void
		{
			bg= new IntroBG();
			addChild(bg);
			
			mmb = new Image(Assets.MMBTexture);
			mmb.y = -800;
			mmb.alpha = 0;
			addChild(mmb);
			
			mmnew = new Button(Assets.MMNTexture);
			mmnew.addEventListener(Event.TRIGGERED, onNew);
			mmnew.x = -500;
			mmnew.y = 147;
			addChild(mmnew);
			
			mmload = new Button(Assets.MMLTexture);
			mmload.addEventListener(Event.TRIGGERED, onLoad);
			mmload.x = -500;
			mmload.y = 261;
			addChild(mmload);
			
			mmc = new Button(Assets.MMCTexture);
			mmc.addEventListener(Event.TRIGGERED, onC);
			mmc.x = -500;
			mmc.y = 374;
			addChild(mmc);
			
			Starling.juggler.tween(mmb, .25, {
				x: 0,
				y: 0,
				alpha: 100
				
			});
			
			Starling.juggler.tween(mmnew, .25, {
				x: -89
			});
			
			Starling.juggler.tween(mmload, .25, {
				x: -89
			});
			
			Starling.juggler.tween(mmc, .25, {
				x: -89
			});
		}
		
		private function onC():void
		{
			
			Starling.juggler.tween(mmb, .25, {
				x: -785				
			});
			
			Starling.juggler.tween(mmc, .5, {
			onComplete: function():void { game.changeState(Game.CREDIT); },
				x: -550
			});
			
			Starling.juggler.tween(mmload, .25, {
				//onComplete: function():void { game.changeState(Game.CODE); },
				x: -550
			});
			
			Starling.juggler.tween(mmnew, .25, {
				//onComplete: function():void { game.changeState(Game.MMENU); },
				x: -550
			});
		}
		
		private function onLoad():void
		{
			Starling.juggler.tween(mmb, .25, {
				x: -785				
			});
			
			Starling.juggler.tween(mmc, .25, {
				//onComplete: function():void { game.changeState(Game.CREDIT); },
				x: -550
			});
			
			Starling.juggler.tween(mmload, .5, {
				onComplete: function():void { game.changeState(Game.CODE); },
				x: -550
			});
			
			Starling.juggler.tween(mmnew, .25, {
				//onComplete: function():void { game.changeState(Game.MMENU); },
				x: -550
			});		}
		
		private function onNew():void
		{
			game.setCode("000000");
			game.setGold(0);
			game.shootLevel = 0;
			game.setBookLevel("00");
			Starling.juggler.tween(mmb, .25, {
				x: -785				
			});
			
			Starling.juggler.tween(mmc, .25, {
				x: -550
			});
			
			Starling.juggler.tween(mmload, .25, {
				x: -550
			});
			
			Starling.juggler.tween(mmnew, .5, {
				x: -550
			});	
		
			Starling.juggler.tween(bg, .5, {
				alpha:0,
				onComplete: function():void { game.changeState(Game.MMENU); }

			});
		}
		
		public function update():void
		{
		}
		
		public function destroy():void
		{
			bg.removeFromParent(true);
			bg = null;
			
			mmb.removeFromParent(true);
			mmb = null;
			
			mmnew.removeFromParent(true);
			mmnew = null;
			
			mmload.removeFromParent(true);
			mmload = null;
			
			mmc.removeFromParent(true);
			mmc = null;
		}
	}
}