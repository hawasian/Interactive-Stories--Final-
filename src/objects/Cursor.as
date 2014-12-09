package objects
{
	import core.Assets;
	
	import interfaces.IState;
	
	import starling.core.Starling;
	import starling.display.Image;
	import starling.display.Sprite;
	
	public class Cursor extends Sprite
	{
		private var play:IState;
		public function Cursor(play:IState)
		{
			this.play = play;
			
			var img:Image = new Image(Assets.ACursorTexture);
			img.pivotX = 50;
			img.pivotY = 30;
			addChild(img);
		}
		
		public function update():void
		{
			x += (Starling.current.nativeStage.mouseX - x) * 0.65;
			y += (Starling.current.nativeStage.mouseY - y) * 0.65;
		}
	}
}