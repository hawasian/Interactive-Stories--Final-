package states
{
	import core.Game;
	
	import interfaces.IState;
	
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class OMenu extends Sprite implements IState
	{
		private var game:Game;
		
		public function OMenu(game:Game)
		{
			this.game = game;
			addEventListener(Event.ADDED_TO_STAGE,init);
		}
		
		private function init():void
		{
		}
		
		public function update():void
		{
		}
		
		public function destroy():void
		{
		}
	}
}