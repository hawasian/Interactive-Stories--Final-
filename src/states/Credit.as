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
	
	public class Credit extends Sprite implements IState
	{
		private var game:Game;
		private var bg:IntroBG;
		private var creditb:Image;
		private var coder:Button;
		
		public function Credit(game:Game)
		{
			this.game = game;
			addEventListener(Event.ADDED_TO_STAGE,init);
		}
		
		private function init():void
		{
			bg= new IntroBG();
			addChild(bg);
			
			creditb = new Image(Assets.CreditBTexture);
			creditb.x = -800;
			addChild(creditb);
			
			coder = new Button(Assets.CodeRTexture);
			coder.addEventListener(Event.TRIGGERED, onReturn);
			coder.x = 1300;
			coder.y = 425;
			addChild(coder);
			
			Starling.juggler.tween(creditb, .25, {
				x: 0				
			});
			
			Starling.juggler.tween(coder, .25, {
				x: 415				
			});
		}
		
		private function onReturn():void
		{
			Starling.juggler.tween(creditb, .25, {
				x: 800				
			});
			
			Starling.juggler.tween(coder, .5, {
				onComplete: function():void { game.changeState(Game.TMENU); },
				x: 1000
			});		

		}
		public function update():void
		{
		}
		
		public function destroy():void
		{
			bg.removeFromParent(true);
			bg = null;
			
			creditb.removeFromParent(true);
			creditb = null;
			
			coder.removeFromParent(true);
			coder = null;
		}
	}
}