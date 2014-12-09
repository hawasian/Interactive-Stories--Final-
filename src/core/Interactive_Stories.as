package core
{
	import flash.display.Sprite;
	
	import starling.core.Starling;
	
	[SWF(width="782", height="522", frameRate="60", backgroundColor="#000033")]
	public class Interactive_Stories extends Sprite
	{
		public function Interactive_Stories()
		{
			var star:Starling = new Starling(Game, stage);
			//star.showStats = true;
			star.start();
		}
	}
}