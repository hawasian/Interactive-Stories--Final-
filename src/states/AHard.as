package states
{
	import core.Assets;
	import core.Game;
	
	import flash.display.Stage;
	import flash.events.MouseEvent;
	
	import interfaces.IState;
	
	import starling.animation.Transitions;
	import starling.core.Starling;
	import starling.display.Button;
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	import starling.utils.deg2rad;
	
	public class AHard extends Sprite implements IState
	{
		private const arrownum:int = 20;
		private const sHit:int = 400;
		private const xoff:int = 800;
		private var nummarks:int = 0;
		private var game:Game;
		private var bg:Image;
		private var bgArrow:DisplayObject
		private var ns:Stage;
		private var backer:Image;
		private var num:TextField;
		private var numArrows:TextField;
		private var S1:Button;
		private var S2:Button;
		private var S3:Button;
		private var S4:Button;
		private var S5:Button;
		private var aWall:Image;

		
		public function AHard(game:Game)
		{
			this.game = game;
			addEventListener(Event.ADDED_TO_STAGE,init);
		}
		
		private function init():void
		{
			game.setScore(0);
			ns =  Starling.current.nativeStage;
			ns.addEventListener(MouseEvent.MOUSE_DOWN, fire);
			
			bg = new Image(Assets.RangeBGTexture);
			addChild(bg);
			
			bgArrow = new Image(Assets.PlayArrowTexture);
			bgArrow.x=315-13;
			bgArrow.y=180+3;
			addChild(bgArrow);
			
			Starling.juggler.tween(bgArrow, .75, {
				transition: Transitions.EASE_IN_OUT,
				x: 667,
				y: 299,
				rotation: deg2rad(40)
			});
			
			S1 = new Button(Assets.TStrawTexture);
			S1.addEventListener(Event.TRIGGERED, function():void { hit(S1);});
			S1.x = 17-xoff;
			S1.y = 467;
			addChild(S1);
			
			S2 = new Button(Assets.TStrawTexture);
			S2.addEventListener(Event.TRIGGERED, function():void { hit(S2);});
			S2.x = 167-xoff;
			S2.y = 467;
			addChild(S2);
			
			S3 = new Button(Assets.TStrawTexture);
			S3.addEventListener(Event.TRIGGERED, function():void { hit(S3);});
			S3.x = 327-xoff;
			S3.y = 467;
			addChild(S3);
			
			S4 = new Button(Assets.TStrawTexture);
			S4.addEventListener(Event.TRIGGERED, function():void { hit(S4);});
			S4.x = 477-xoff;
			S4.y = 467;
			addChild(S4);
			
			S5 = new Button(Assets.TStrawTexture);
			S5.addEventListener(Event.TRIGGERED, function():void { hit(S5);});
			S5.x = 627-xoff;
			S5.y = 467;
			addChild(S5);
			
			aWall = new Image(Assets.AWallTexture);
			aWall.x=-18-xoff;
			aWall.y=415;
			addChild(aWall);
			
			Starling.juggler.tween(aWall, .75, {
				x: aWall.x+xoff
			});
			
			Starling.juggler.tween(S1, .75, {
				x: S1.x+xoff
			});
			Starling.juggler.tween(S2, .75, {
				x: S2.x+xoff
			});
			Starling.juggler.tween(S3, .75, {
				x: S3.x+xoff
			});
			Starling.juggler.tween(S4, .75, {
				x: S4.x+xoff
			});
			Starling.juggler.tween(S5, .75, {
				x: S5.x+xoff
			});
			
			engageRandom();
			
			backer = new Image(Assets.AScoreBackTexture);
			backer.x = 525;
			backer.y = 25-380;
			addChild(backer);
			
			num = new TextField(683,35,String("Score "+game.getScore()),"Assets.Pompeii",20,0x0);
			num.x=550;
			num.y=-300;
			num.hAlign = "left";
			addChild(num);
			
			numArrows = new TextField(683,35,String("Arrows Remaining "+(arrownum-nummarks)),"Assets.Pompeii",20,0x0);
			numArrows.x=550;
			numArrows.y=-340;
			numArrows.hAlign = "left";
			addChild(numArrows);
			
			Starling.juggler.tween(backer, 1, {
				y: backer.y+380
			});
			
			Starling.juggler.tween(num, 1, {
				y: num.y+380
			});
			
			Starling.juggler.tween(numArrows, 1, {
				y: numArrows.y+380
			});


		}
		
		private function fire(event:MouseEvent):void
		{
			nummarks++;
			if(nummarks > arrownum)
				transOut();
		}
		
		private function transOut():void
		{
			game.changeState(Game.AGMOR);	
		}
		private function engage(b:Button):void
		{
			Starling.juggler.tween(b, .5, {
				y: 236
			});
		}
		private function engageRandom():void
		{
			var x:int =Math.round( Math.random()*4);
			if(x==0)
			{
				engage(S1);
			}else if(x==1){
				engage(S2);
			}else if(x==2){
				engage(S3);
			}else if(x==3){
				engage(S4);
			}else{
				engage(S5);
			}
		}
		private function hit(b:Button):void
		{
			Starling.juggler.tween(b, .25, {
				y: 467,
				onComplete: engageRandom()
			});
			game.addScore(sHit);
		}
		
		public function update():void
		{
			num.text = String("Score "+game.getScore());
			numArrows.text = String("Arrows Remaining "+(arrownum-nummarks));
		}
		
		public function destroy():void
		{
			bg.removeFromParent(true);
			bg = null;
			
			bgArrow.removeFromParent(true);
			bgArrow = null;
			
			num.removeFromParent(true);
			num = null;
			
			numArrows.removeFromParent(true);
			numArrows = null;
			
			backer.removeFromParent(true);
			backer = null;
			
			S1.removeFromParent(true);
			S1 = null;
			
			S2.removeFromParent(true);
			S2 = null;
			
			S3.removeFromParent(true);
			S3 = null;
			
			S4.removeFromParent(true);
			S4 = null;
			
			S5.removeFromParent(true);
			S5 = null;
			
			aWall.removeFromParent(true);
			aWall = null;
			
			ns.removeEventListener(MouseEvent.MOUSE_DOWN, fire);
		}
	}
}