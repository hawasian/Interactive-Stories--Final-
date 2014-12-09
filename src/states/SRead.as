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
	import starling.textures.TextureAtlas;
	
	public class SRead extends Sprite implements IState
	{
		private var game:Game;
		private var book:int;
		private var bg:Image;
		private var wrapper:Image;
		private var page:Array = new Array();

		private const xoff:int=800;
		private const yoff:int=0;
		private var back:Button;
		private var next:Button;
		private var close:Button;
		private var pagen:int = 0;
		private var b:TextureAtlas;
		private var l:int;

		
		public function SRead(game:Game)
		{
			this.game = game;
			addEventListener(Event.ADDED_TO_STAGE,init);
		}
		
		private function init():void
		{
			this.book = game.getBook();
			bg = new Image(Assets.AmphiBGTexture);
			addChild(bg);
			switch(book)
			{
				case 0:
					b =Assets.b0;
					l =4;
					break;
				case 1:
					b =Assets.b1;
					l =8;
					break;
				default:
					b=null;
					l =0;
					break;
			}

			var i:int;
			for(i=l; i>=1; i--)
			{
				page[i-1] = new Image(b.getTexture(String("p"+i)));
				page[i-1].x = 11;
				page[i-1].y = 12;
				addChild(page[i-1]);
			}
			
			wrapper = new Image(Assets.SWrapTexture);
			wrapper.x = xoff;
			wrapper.y = yoff;
			addChild(wrapper);
			
			back = new Button(Assets.StBackTexture);
			back.addEventListener(Event.TRIGGERED, onBack);
			back.x =9+xoff;
			back.y =381+yoff;
			addChild(back);
			
			next = new Button(Assets.StNextTexture);
			next.addEventListener(Event.TRIGGERED, onNext);
			next.x =644+xoff;
			next.y =381+yoff;
			addChild(next);
			
			close = new Button(Assets.StCloseTexture);
			close.addEventListener(Event.TRIGGERED, function():void {game.changeState(Game.SMENU)});
			close.x =238+xoff;
			close.y =407+yoff;
			addChild(close);
			
			Starling.juggler.tween(wrapper, .25, {
				x: 0,
				y: 0
			});
			Starling.juggler.tween(close, .25, {
				x: close.x - xoff,
				y: close.y - yoff
			});
			Starling.juggler.tween(back, .25, {
				x: back.x - xoff,
				y: back.y - yoff
			});
			
			Starling.juggler.tween(next, .25, {
				x: next.x - xoff,
				y: next.y - yoff
			});
		}
		
		private function onNext():void
		{
			if(pagen<(l-1)){
				pagen++;
				Starling.juggler.tween(page[pagen-1], .25, {
					x: 11 - xoff
				});
			}			
		}
		
		private function onBack():void
		{
			if(pagen>0){
				pagen--;
				Starling.juggler.tween(page[pagen], .25, {
					x: page[pagen].x + xoff
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
			wrapper.removeFromParent(true);
			wrapper = null;
			back.removeFromParent(true);
			back = null;
			next.removeFromParent(true);
			next = null;
			close.removeFromParent(true);
			close = null;
			var i:int;
			for(i=l-1; i>=0; i--){
				page[i].removeFromParent(true);
				page[i] = null;
			}
		}
	}
}