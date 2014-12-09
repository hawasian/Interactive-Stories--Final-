package states
{
	import core.Game;
	
	import interfaces.IState;
	
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class QGameOver extends Sprite implements IState
	{
		private var game:Game;
		
		public function QGameOver(game:Game)
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