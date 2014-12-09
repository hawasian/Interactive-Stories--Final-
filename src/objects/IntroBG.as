package objects
{
	import core.Assets;
	
	import starling.display.Image;
	import starling.display.Sprite;
	
	public class IntroBG extends Sprite
	{

		private var sky:Image;
		public function IntroBG()
		{
			sky= new Image(Assets.WaveBGTexture);
			addChild(sky);
		}
	}
}