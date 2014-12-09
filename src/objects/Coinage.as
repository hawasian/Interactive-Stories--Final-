package objects
{
	import core.Assets;
	
	import starling.display.Image;
	import starling.display.Sprite;
	
	public class Coinage extends Sprite
	{
		private var coins:Image
		public function Coinage()
		{
			coins= new Image("assets/coinage.png");
			coins.x = 625;
			coins.y = -40;
			addChild(coins);
		}
	}
}