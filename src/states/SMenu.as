package states
{
	import core.Assets;
	import core.Game;
	
	import interfaces.IState;
	
	import starling.core.Starling;
	import starling.display.Button;
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class SMenu extends Sprite implements IState
	{
		private var game:Game;
		private var bg:Image;
		private var right:Image;
		private var top:Image;
		private var left:Image;
		private var up:Button;
		private var plate:Image;
		private var down:Button;
		private var returner:Button;
		private var backer:Image;
		private var board:Image;
		
		private var b1:Button;
		private var boardT:Image;
		private var boardB:Image;
		private var boardS:Image;
		private var b0:Button;
		private var b:Array = new Array();
		
		public function SMenu(game:Game)
		{
			this.game = game;
			addEventListener(Event.ADDED_TO_STAGE,init);
		}
		
		private function init():void
		{
			game.book =0;
			bg = new Image(Assets.AmphiBGTexture);
			addChild(bg);
			game.setBook(0);
			returner = new Button(Assets.AmphiReturnTexture);
			returner.addEventListener(Event.TRIGGERED, toMain);
			returner.x =20;
			returner.y =105;
			addChild(returner);
			backer = new Image(Assets.AmphiBackerTexture);
			backer.x =429;
			backer.y =98;
			addChild(backer);
			board = new Image(Assets.AmphiBoardTexture);
			board.x =421;
			board.y =0;
			addChild(board);
			
			setStories();
			
			boardT = new Image(Assets.AmphiBTTexture);
			boardT.x =421;
			boardT.y =0;
			addChild(boardT);
			
			boardB = new Image(Assets.AmphiBBTexture);
			boardB.x =421;
			boardB.y =452;
			addChild(boardB);
			
			boardS = new Image(Assets.AmphiBSTexture);
			boardS.x =728;
			boardS.y =0;
			addChild(boardS);
			
			up = new Button(Assets.AmphiUpTexture);
			up.addEventListener(Event.TRIGGERED, upper);
			up.x =692;
			up.y =60;
			addChild(up);
			down = new Button(Assets.AmphiDownTexture);
			down.addEventListener(Event.TRIGGERED, downer);
			down.x =692;
			down.y =390;
			addChild(down);
			plate = new Image(Assets.AmphiPlateTexture);
			plate.x =-30;
			plate.y =-20;
			addChild(plate);
			InitCurtain();
			SetCurtain();
		}
		
		private function downer():void
		{
			var i:int;
			if(b[0].y > -700){
				for(i=1; i>=0; i--)
				{
					Starling.juggler.tween(b[i], .05, {
						y:b[i].y-100
					});;
				}
			}
		}
		
		private function upper():void
		{
			var i:int;
			if(b[0].y < 97){
				for(i=1; i>=0; i--)
				{
					Starling.juggler.tween(b[i], .05, {
						y:b[i].y+100
					});;
				}
			}			
		}
		
		private function toMain():void
		{
			CloseCurtain();
			Starling.juggler.tween(top, .5, {
				onComplete:function():void { game.setBook(Game.MEDUSA); game.changeState(Game.MMENU); }
			});
			
		}
		
		private function setStories():void
		{
			b[0] = new Button(Assets.AmphB0Texture);
			b[0].addEventListener(Event.TRIGGERED, function():void { game.book = 0; game.changeState(Game.SREAD); });
			b[0].x =450;
			b[0].y =150;
			addChild(b[0]);	
			
			b[1] = new Button(Assets.AmphB1Texture);
			b[1].addEventListener(Event.TRIGGERED, function():void { game.book = 1; if(game.b1==1){game.changeState(Game.SREAD); }});
			b[1].x =450;
			b[1].y =260;
			addChild(b[1]);	
			
		}
		
		private function InitCurtain():void
		{
			right = new Image(Assets.CurtainRightTexture);
			right.x =372;
			right.y =-62;
			addChild(right);
			
			left = new Image(Assets.CurtainLeftTexture);
			left.x =-170;
			left.y =-62;
			addChild(left);
			
			top = new Image(Assets.CurtainTopTexture);
			top.x =-48;
			top.y =-82;
			addChild(top);
		}
		
		private function SetCurtain():void
		{
			var time:Number = .5;
			Starling.juggler.tween(right, time, {
				x: 830
			});
			Starling.juggler.tween(left, time, {
				x: -651
			});
			Starling.juggler.tween(top, time, {
				y: -204
			});
		}
		
		private function CloseCurtain():void
		{
			var time:Number = .5;
			Starling.juggler.tween(right, time, {
				x: 372
			});
			Starling.juggler.tween(left, time, {
				x: -170
			});
			Starling.juggler.tween(top, time, {
				y: -82
			});
		}
		
		public function update():void
		{
		}
		
		public function destroy():void
		{
			bg.removeFromParent(true);
			bg = null;
			backer.removeFromParent(true);
			backer = null;
			board.removeFromParent(true);
			board = null;
			up.removeFromParent(true);
			up = null;
			down.removeFromParent(true);
			down = null;
			plate.removeFromParent(true);
			plate = null;
			returner.removeFromParent(true);
			returner = null;
			left.removeFromParent(true);
			left = null;
			right.removeFromParent(true);
			right = null;
			top.removeFromParent(true);
			top = null;		
			boardS.removeFromParent(true);
			boardS = null;
			boardT.removeFromParent(true);
			boardT = null;
			boardB.removeFromParent(true);
			boardB = null;
			
			b[0].removeFromParent(true);
			b[0] = null;	
			b[1].removeFromParent(true);
			b[1] = null;	
		}
	}
}