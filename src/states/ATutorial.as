package states
{
	import core.Assets;
	import core.Game;
	
	import interfaces.IState;
	
	import starling.animation.Transitions;
	import starling.core.Starling;
	import starling.display.Button;
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.utils.deg2rad;
	
	public class ATutorial extends Sprite implements IState
	{
		private const xoff:int = 800;
		private var game:Game;
		private var bg:Image;
		private var bgArrow:DisplayObject;
		private var close:Button;
		private var next:Button;
		private var back:Button;
		private var book:Array = new Array();
		private var page:int = 0;
		
		public function ATutorial(game:Game)
		{
			this.game = game;
			addEventListener(Event.ADDED_TO_STAGE,init);
		}
		
		private function init():void
		{
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
			var i:int;
			for(i=5; i>=1; i--)
			{
				book[i-1] = new Image(Assets.atb.getTexture(String("ATP"+i)));
				book[i-1].x = 28 + xoff;
				book[i-1].y = 23;
				addChild(book[i-1]);
				Starling.juggler.tween(book[i-1], .75, {
					x: 68
				});
			}
				
			
			next = new Button(Assets.atb.getTexture("ATNext"));
			next.addEventListener(Event.TRIGGERED, function():void { onNext();});

			next.x = 673 + xoff;
			next.y = 349;
			addChild(next);
			
			Starling.juggler.tween(next, .75,{
				x:next.x - xoff
			});
			
			back = new Button(Assets.atb.getTexture("ATBack"));
			back.addEventListener(Event.TRIGGERED, function():void { onBack();});
			
			back.x = -8 + xoff;
			back.y = 349;
			addChild(back);
			
			Starling.juggler.tween(back, .75,{
				x:back.x - xoff
			});
			
		
			close = new Button(Assets.atb.getTexture("ATClose"));
			close.addEventListener(Event.TRIGGERED, function():void { game.changeState(Game.AMENU);});
			close.x = 314 + xoff;
			close.y = 415;
			addChild(close);
			
			Starling.juggler.tween(close, .75,{
				x:close.x - xoff
			});

		}
		private function onNext():void
		{
			if(page<4){
				page++;
				Starling.juggler.tween(book[page-1], .25, {
					x: 68 - xoff
				});
			}
			
		}
		private function onBack():void
		{
			if(page>0){
				page--;
				Starling.juggler.tween(book[page], .25, {
					x: book[page].x + xoff
				});
			}	
		}
		public function update():void
		{
		}
		
		public function destroy():void
		{
			bg.removeFromParent(true);
			bg = null;
			
			bgArrow.removeFromParent(true);
			bgArrow = null;
			
			close.removeFromParent(true);
			close = null;
			
			back.removeFromParent(true);
			back = null;
			
			next.removeFromParent(true);
			next = null;
			
			var i:int;
			for(i=4; i>=0; i--){
				book[i].removeFromParent(true);
				book[i] = null;
			}
		}
	}
}