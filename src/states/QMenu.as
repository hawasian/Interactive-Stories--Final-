package states
{
	import core.Assets;
	import core.Game;
	
	import interfaces.IState;
	
	import starling.animation.Transitions;
	import starling.core.Starling;
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.utils.deg2rad;
	
	public class QMenu extends Sprite implements IState
	{
		private var game:Game;
		private var bg:Image;
		private var board:Image;
		private var top:Image;
		private var btm:Image;
		private var side:Image;
		private var plate:Image;
		private var returner:Button;
		private var b0:Button;
		private var b:Array = new Array();
		private var up:Button;
		private var dn:Button;
		
		public function QMenu(game:Game)
		{
			this.game = game;
			addEventListener(Event.ADDED_TO_STAGE,init);
		}
		
		private function init():void
		{
			game.book = 0;
			bg = new Image(Assets.QBGTexture);
			bg.alpha = 0;
			addChild(bg);
			
			Starling.juggler.tween(bg, 1.5, {
				alpha:100
			});
			
			board = new Image(Assets.QBoardTexture);
			board.alpha = 0;
			board.x = 404;
			addChild(board);
			
			Starling.juggler.tween(board, 1.5, {
				alpha:100
			});
			
			initbuttons();
			
			top = new Image(Assets.QBTopTexture);
			top.alpha = 0;
			top.x = 404;
			addChild(top);
			
			Starling.juggler.tween(top, 1.5, {
				alpha:100
			});
			
			btm = new Image(Assets.QBBtmTexture);
			btm.alpha = 0;
			btm.x = 404;
			btm.y = 420;
			addChild(btm);
			
			Starling.juggler.tween(btm, 1.5, {
				alpha:100
			});
			
			side = new Image(Assets.QBSideTexture);
			side.alpha = 0;
			side.x = 681;
			addChild(side);
			
			Starling.juggler.tween(side, 1.5, {
				alpha:100
			});
			
			plate = new Image(Assets.QMPlateTexture);
			plate.alpha = 0;
			plate.x = 27;
			plate.y = 11;
			addChild(plate);
			
			Starling.juggler.tween(plate, 1.5, {
				alpha:100
			});
			
			returner = new Button(Assets.QBReturnTexture);
			returner.addEventListener(Event.TRIGGERED, OnReturn);
			returner.alpha = 0;
			returner.x = 82;
			returner.y = 375;
			addChild(returner);
			
			Starling.juggler.tween(returner, 1.5, {
				alpha:100
			});
			
			up = new Button(Assets.QUpTexture);
			up.addEventListener(Event.TRIGGERED, OnUp);
			up.alpha = 0;
			up.x = 679;
			up.y = 21;
			addChild(up);
			
			dn = new Button(Assets.QDnTexture);
			dn.addEventListener(Event.TRIGGERED, OnDn);
			dn.alpha = 0;
			dn.x = 679;
			dn.y = 362;
			addChild(dn);
			
			Starling.juggler.tween(up, 1.5, {
				alpha:100
			});
			Starling.juggler.tween(dn, 1.5, {
				alpha:100
			});
		}
		
		private function OnDn():void
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
		
		private function OnUp():void
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
		
		private function initbuttons():void
		{
			b[0] = new Button(Assets.QB0Texture);
			b[0].addEventListener(Event.TRIGGERED, function():void {game.book = 0; Fade(); });
			b[0].alpha = 0;
			b[0].x = 439;
			b[0].y = 97;
			addChild(b[0]);
			
			Starling.juggler.tween(b[0], 1.5, {
				alpha:100
			});
			
			b[1] = new Button(Assets.QB1Texture);
			b[1].addEventListener(Event.TRIGGERED, function():void {if(game.b1==1){game.book = 1; Fade(); }});
			b[1].alpha = 0;
			b[1].x = 439;
			b[1].y = 207;
			addChild(b[1]);
			
			Starling.juggler.tween(b[1], 1.5, {
				alpha:100
			});
		}
		private function Fade():void
		{
			var time:Number = .5;
			Starling.juggler.tween(board, time, {
				alpha:0
			});		
			Starling.juggler.tween(top, time, {
				alpha:0
			});		
			Starling.juggler.tween(btm, time, {
				alpha:0
			});		
			Starling.juggler.tween(side, time, {
				alpha:0
			});	
			Starling.juggler.tween(plate, time, {
				alpha:0
			});		
			Starling.juggler.tween(returner, time, {
				alpha:0
			});		
			Starling.juggler.tween(up, time, {
				alpha:0
			});	
			Starling.juggler.tween(dn, time, {
				alpha:0
			});	
			var i:int;
			for(i=1; i>=0; i--)
			{
				Starling.juggler.tween(b[i], .15, {
					alpha:0
				});;
				Starling.juggler.tween(b[i], .2, {
					//delay: .15,
					x:800
				});;
			}
			Starling.juggler.tween(returner, time+.2, {
				onComplete:function():void { game.changeState(Game.QPLAY); }
			});	
		}
		private function OnReturn():void
		{
			var time:Number = .4;
			Starling.juggler.tween(bg, time, {
				delay:.2,
				alpha:0
			});		
			Starling.juggler.tween(board, time, {
				delay:.2,
				alpha:0
			});		
			Starling.juggler.tween(top, time, {
				delay:.2,
				alpha:0
			});		
			Starling.juggler.tween(btm, time, {
				delay:.2,
				alpha:0
			});		
			Starling.juggler.tween(side, time, {
				delay:.2,
				alpha:0
			});	
			Starling.juggler.tween(plate, time, {
				delay:.2,
				alpha:0
			});		
			Starling.juggler.tween(returner, time, {
				delay:.2,
				alpha:0
			});	
			Starling.juggler.tween(up, time, {
				delay:.2,
				alpha:0
			});		
			Starling.juggler.tween(dn, time, {
				delay:.2,
				alpha:0,
				onComplete:function():void {game.changeState(Game.MMENU);}
			});		
			var i:int;
			for(i=1; i>=0; i--)
			{
				Starling.juggler.tween(b[i], .15, {
					alpha:0
				});;
				Starling.juggler.tween(b[i], .2, {
					//delay: .15,
					x:800
				});;
			}
		}
		
		public function update():void
		{
		}
		
		public function destroy():void
		{
			bg.removeFromParent(true);
			bg = null;
			
			board.removeFromParent(true);
			board = null;
			
			top.removeFromParent(true);
			top = null;
			
			btm.removeFromParent(true);
			btm = null;
			
			side.removeFromParent(true);
			side = null;
			
			plate.removeFromParent(true);
			plate = null;
			
			returner.removeFromParent(true);
			returner = null;
			
			up.removeFromParent(true);
			up = null;
			
			dn.removeFromParent(true);
			dn = null;
			
			var i:int;
			for(i=1; i>=0; i--)
			{
			b[i].removeFromParent(true);
			b[i] = null;
			}
		}
	}
}