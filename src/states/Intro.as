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
	import starling.utils.deg2rad;
	
	public class Intro extends Sprite implements IState
	{
		private var game:Game;
		private var bg:IntroBG
		private var plate:Image;
		private var play:Button;
		
		public function Intro(game:Game)
		{
			this.game = game;
			addEventListener(Event.ADDED_TO_STAGE,init);
		}
		
		private function init():void
		{
			bg= new IntroBG();
			addChild(bg);
			
			plate = new Image(Assets.TPTexture);
			plate.pivotX =  160;
			plate.pivotY = 100;
			plate.x = 517;
			plate.y = 185;
			addChild(plate);
			
			play = new Button(Assets.SBUTexture);
			play.addEventListener(Event.TRIGGERED, onPlay);
			play.pivotX =  75;
			play.pivotY = 50;
			play.x = 350;
			play.y = 350;
			addChild(play);
		}
		
		public function update():void
		{
		}
		
		public function destroy():void
		{
			bg.removeFromParent(true);
			bg = null;
			
			plate.removeFromParent(true);
			plate = null;
			
			play.removeFromParent(true);
			play = null;
		}
		
		public function onPlay(): void
		{
			Starling.juggler.tween(play, .5, {
				rotation: deg2rad(540),
				alpha: 0
			});
			Starling.juggler.tween(plate, .5, {
				transition: Transitions.EASE_OUT,
				onComplete: function():void { game.changeState(Game.TMENU); },
				x: 787,
				y: 0,
				alpha: 0
			});
		}
	}
}