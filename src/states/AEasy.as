package states
{
	import core.Assets;
	import core.Game;
	
	import flash.display.Stage;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	
	import interfaces.IState;
	
	import objects.Cursor;
	
	import starling.animation.Transitions;
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	import starling.utils.deg2rad;
	
	public class AEasy extends Sprite implements IState
	{
		private const arrownum:int = 10;
		private var game:Game;
		private var bg:Image;
		private var bgArrow:Image
		private var bullseye:Image;
		private var cursor:Cursor;
		private var ns:Stage;
		private var marks:Array = new Array();
		private var nummarks:int = 0;
		private var p1:Point = new Point();
		private var p2:Point = new Point();
		private var num:TextField;
		private var numArrows:TextField;
		private var backer:Image;
		
		public function AEasy(game:Game)
		{
			this.game = game;
			addEventListener(Event.ADDED_TO_STAGE,init);
		}
		
		private function init():void
		{
			game.setScore(0);
			ns =  Starling.current.nativeStage;
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
			
			bullseye = new Image(Assets.BullseyeETexture);
			bullseye.pivotX=150;
			bullseye.pivotY=150;
			
			bullseye.x=1200;
			bullseye.y=210;
			p2.x = bullseye.x;
			p2.y = bullseye.y;
			addChild(bullseye);
			
			cursor = new Cursor(this);
			addChild(cursor);
			
			Starling.juggler.tween(bullseye, .75, {
				x: 300
			});
			ns.addEventListener(MouseEvent.MOUSE_UP, fire);
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
			marks[nummarks] = new Image(Assets.AMarkTexture);
			marks[nummarks].pivotX =25;
			marks[nummarks].pivotY =25;
			var distance:int = Math.sqrt((Math.pow(Starling.current.nativeStage.mouseX-bullseye.x,2))+(Math.pow(Starling.current.nativeStage.mouseY-bullseye.y,2)));
			if(distance<150)
			{
				marks[nummarks].x =Starling.current.nativeStage.mouseX - x;
				marks[nummarks].y =Starling.current.nativeStage.mouseY - y;
				game.addScore(200 - distance);
				addChild(marks[nummarks]);
				nummarks++;
			}
			if(nummarks > arrownum)
				transOut();
		}
		private function transOut():void
		{
			Starling.juggler.tween(bullseye, .75, {
				x: -350
			});
			var i:int;
			for(i= nummarks-1; i>=0; i--)
			{
				Starling.juggler.tween(marks[i], .5, {
					x: marks[i].x-500
				});
			}
			
			Starling.juggler.tween(backer, 1, {
				y: backer.y-380
			});
			
			Starling.juggler.tween(num, 1, {
				y: num.y-380
			});
			
			Starling.juggler.tween(numArrows, 1, {
				y: numArrows.y-380
			});
			
			Starling.juggler.tween(bg, 1.25, {
				onComplete: function():void { game.changeState(Game.AGMOR);}
			});
			
		}
		public function update():void
		{
			num.text = String("Score "+game.getScore());
			numArrows.text = String("Arrows Remaining "+(arrownum-nummarks));
			cursor.update();
		}
		
		public function destroy():void
		{
			bg.removeFromParent(true);
			bg = null;
			
			bgArrow.removeFromParent(true);
			bgArrow = null;
			
			bullseye.removeFromParent(true);
			bullseye = null;
			
			cursor.removeFromParent(true);
			cursor = null;
			
			num.removeFromParent(true);
			num = null;
			
			numArrows.removeFromParent(true);
			numArrows = null;
			
			backer.removeFromParent(true);
			backer = null;
			
			ns.removeEventListener(MouseEvent.MOUSE_UP, fire);
			var i:int;
			for(i= nummarks-1; i>=0; i--)
			{
			marks[i].removeFromParent(true);
			marks[i] = null;
			}
			
		}
	}
}