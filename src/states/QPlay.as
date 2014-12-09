package states
{
	import core.Assets;
	import core.Game;
	
	import interfaces.IState;
	
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.TextureAtlas;
	
	public class QPlay extends Sprite implements IState
	{
		private var game:Game;
		private var bg:Image;
		private var frame:Image;
		private var book:int;
		private var b:TextureAtlas;
		private var l:int;
		private var qnum:int;
		private var quest:Image;
		
		private const x1:int=30;
		private const x2:int=409;
		private const y1:int=246;
		private const y2:int=382;
		private var ans:Array = new Array();
		private var value:int;
		private var randlist:Array = new Array();

		
		public function QPlay(game:Game)
		{
			this.game = game;
			addEventListener(Event.ADDED_TO_STAGE,init);
		}
		
		private function init():void
		{
			qnum = 1;
			this.book = game.getBook();
			
			switch(book)
			{
				case 0:
					b =Assets.q0;
					l =6;
					value = 10;
					break;
				case 1:
					b =Assets.q1;
					l =8;
					value = 20;
					break;
				default:
					b=null;
					l =0;
					value = 0;
					break;
			}

			bg = new Image(Assets.QBGTexture);
			addChild(bg);
			
			quest = new Image(b.getTexture(String("QP"+qnum)));
			quest.x=30;
			quest.y=27;
			addChild(quest);
			
			frame = new Image(Assets.QFrameTexture);
			frame.x=12;
			frame.y=11;
			addChild(frame);
			
			randlist[0] = Math.floor(Math.random()*(1+4-1))+1;
			
			randlist[1] = Math.floor(Math.random()*(1+4-1))+1;
			while(randlist[0]==randlist[1]){
				randlist[1] = Math.floor(Math.random()*(1+4-1))+1;
			}
			
			randlist[2] = Math.floor(Math.random()*(1+4-1))+1;
			while(randlist[0]==randlist[2] || randlist[1]==randlist[2] ){
				randlist[2] = Math.floor(Math.random()*(1+4-1))+1;
			}
			
			randlist[3] = Math.floor(Math.random()*(1+4-1))+1;
			while(randlist[0]==randlist[3] || randlist[1]==randlist[3] || randlist[2]==randlist[3]){
				randlist[3] = Math.floor(Math.random()*(1+4-1))+1;
			}

			
			ans[1] = new Button(b.getTexture(String("Q"+qnum+"A"+randlist[0])));
			ans[1].addEventListener(Event.TRIGGERED, function():void {if(randlist[0]==1){qnum++;if(qnum > l){game.addGold(value);game.changeState(Game.QMENU);}else{delButton();}} });
			ans[1].x = x1;
			ans[1].y = y1;
			addChild(ans[1]);
			
			ans[2] = new Button(b.getTexture(String("Q"+qnum+"A"+randlist[1])));
			ans[2].addEventListener(Event.TRIGGERED, function():void {if(randlist[1]==1){qnum++;if(qnum > l){game.addGold(value);game.changeState(Game.QMENU);}else{delButton();}} });
			ans[2].x = x1;
			ans[2].y = y2;
			addChild(ans[2]);
			
			ans[3] = new Button(b.getTexture(String("Q"+qnum+"A"+randlist[2])));
			ans[3].addEventListener(Event.TRIGGERED, function():void {if(randlist[2]==1){qnum++;if(qnum > l){game.addGold(value);game.changeState(Game.QMENU);}else{delButton();}} });
			ans[3].x = x2;
			ans[3].y = y1;
			addChild(ans[3]);
			
			ans[4] = new Button(b.getTexture(String("Q"+qnum+"A"+randlist[3])));
			ans[4].addEventListener(Event.TRIGGERED, function():void {if(randlist[3]==1){qnum++;if(qnum > l){game.addGold(value);game.changeState(Game.QMENU);}else{delButton();}} });
			ans[4].x = x2;
			ans[4].y = y2;
			addChild(ans[4]);
		
		}
		
		private function delButton():void
		{
			frame.removeFromParent(true);
			frame = null;
			
			quest.removeFromParent(true);
			quest = null;
			
			ans[1].removeFromParent(true);
			ans[1] = null;
			
			ans[2].removeFromParent(true);
			ans[2] = null;
			
			ans[3].removeFromParent(true);
			ans[3] = null;
			
			ans[4].removeFromParent(true);
			ans[4] = null;
			
			quest = new Image(b.getTexture(String("QP"+qnum)));
			quest.x=30;
			quest.y=27;
			addChild(quest);
			
			frame = new Image(Assets.QFrameTexture);
			frame.x=12;
			frame.y=11;
			addChild(frame);
			
			randlist[0] = Math.floor(Math.random()*(1+4-1))+1;
			
			randlist[1] = Math.floor(Math.random()*(1+4-1))+1;
			while(randlist[0]==randlist[1]){
				randlist[1] = Math.floor(Math.random()*(1+4-1))+1;
			}
			
			randlist[2] = Math.floor(Math.random()*(1+4-1))+1;
			while(randlist[0]==randlist[2] || randlist[1]==randlist[2] ){
				randlist[2] = Math.floor(Math.random()*(1+4-1))+1;
			}
			
			randlist[3] = Math.floor(Math.random()*(1+4-1))+1;
			while(randlist[0]==randlist[3] || randlist[1]==randlist[3] || randlist[2]==randlist[3]){
				randlist[3] = Math.floor(Math.random()*(1+4-1))+1;
			}
			
			
			ans[1] = new Button(b.getTexture(String("Q"+qnum+"A"+randlist[0])));
			ans[1].addEventListener(Event.TRIGGERED, function():void {if(randlist[0]==1){qnum++;if(qnum > l){game.addGold(value);game.changeState(Game.QMENU);}else{delButton();}} });
			ans[1].x = x1;
			ans[1].y = y1;
			addChild(ans[1]);
			
			ans[2] = new Button(b.getTexture(String("Q"+qnum+"A"+randlist[1])));
			ans[2].addEventListener(Event.TRIGGERED, function():void {if(randlist[1]==1){qnum++;if(qnum > l){game.addGold(value);game.changeState(Game.QMENU);}else{delButton();}} });
			ans[2].x = x1;
			ans[2].y = y2;
			addChild(ans[2]);
			
			ans[3] = new Button(b.getTexture(String("Q"+qnum+"A"+randlist[2])));
			ans[3].addEventListener(Event.TRIGGERED, function():void {if(randlist[2]==1){qnum++;if(qnum > l){game.addGold(value);game.changeState(Game.QMENU);}else{delButton();}} });
			ans[3].x = x2;
			ans[3].y = y1;
			addChild(ans[3]);
			
			ans[4] = new Button(b.getTexture(String("Q"+qnum+"A"+randlist[3])));
			ans[4].addEventListener(Event.TRIGGERED, function():void {if(randlist[3]==1){qnum++;if(qnum > l){game.addGold(value);game.changeState(Game.QMENU);}else{delButton();}} });
			ans[4].x = x2;
			ans[4].y = y2;
			addChild(ans[4]);
		}
		
		public function update():void
		{			

		}
		
		public function destroy():void
		{
			bg.removeFromParent(true);
			bg = null;
			
			frame.removeFromParent(true);
			frame = null;
			
			quest.removeFromParent(true);
			quest = null;
			
			ans[1].removeFromParent(true);
			ans[1] = null;
			
			ans[2].removeFromParent(true);
			ans[2] = null;
			
			ans[3].removeFromParent(true);
			ans[3] = null;
			
			ans[4].removeFromParent(true);
			ans[4] = null;
		}
	}
}