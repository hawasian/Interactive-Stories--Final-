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
	import starling.text.TextField;
	
	public class Store extends Sprite implements IState
	{
		private var game:Game;
		private var bg:Image;
		private var fplate:Image;
		private var returner:Button;
		private var num:TextField;
		private var hero:Button;
		private var titan:Button;
		private var demi:Button;
		private var pconfirm:Button;
		private var pcancel:Button;
		private var pplate:Image;
		private var xoff:int = 800;
		private var item:String;
		private var price:int;
		private var buy:int;
		private var itemD:TextField;
		private var itemP:TextField;
		private var as1:Button;
		
		public function Store(game:Game)
		{
			this.game = game;
			addEventListener(Event.ADDED_TO_STAGE,init);
		}
		
		private function init():void
		{
			bg = new Image(Assets.ArmBGTexture);
			addChild(bg);
			
			fplate = new Image(Assets.ArmFundsTexture);
			fplate.x = 11;
			fplate.y = 374;
			addChild(fplate);
			
			num = new TextField(683,85,String("$"+game.getGold()),"Assets.Pompeii",45,0x0);
			num.x=60;
			num.y=450;
			num.hAlign = "left";
			addChild(num);
			
			returner = new Button(Assets.ArmReturnTexture);
			returner.addEventListener(Event.TRIGGERED, function():void { game.changeState(Game.MMENU); });
			returner.x =289;
			returner.y =438;
			addChild(returner);
			
			hero = new Button(Assets.ArmHeroTexture);
			hero.addEventListener(Event.TRIGGERED, function():void {  item="Range Level: Hero"; price=10;purchase(1);});
			hero.x =54;
			hero.y =47;
			addChild(hero);
			
			demi = new Button(Assets.ArmDGTexture);
			demi.addEventListener(Event.TRIGGERED, function():void {   item="Range Level: Demigod"; price=20;purchase(2);});
			demi.x =188;
			demi.y =47;
			addChild(demi);
			
			titan = new Button(Assets.ArmTitanTexture);
			titan.addEventListener(Event.TRIGGERED, function():void {  item="Range Level: Titan"; price=30;purchase(3);});
			titan.x =324;
			titan.y =47;
			addChild(titan);
			
			as1 = new Button(Assets.AS1Texture);
			as1.addEventListener(Event.TRIGGERED, function():void {  item="Story: The Origin of Perceus"; price=30;purchase(4);});
			as1.x =474;
			as1.y =249;
			addChild(as1);
			
			pplate = new Image(Assets.ArmPPlateTexture);
			pplate.x = 121+xoff;
			pplate.y = 35;
			addChild(pplate);
			
			pcancel = new Button(Assets.ArmPCancelTexture);
			pcancel.addEventListener(Event.TRIGGERED, function():void {cancel(); });
			pcancel.x =459+xoff;
			pcancel.y =391;
			addChild(pcancel);
			
			pconfirm = new Button(Assets.ArmPConfirmTexture);
			pconfirm.addEventListener(Event.TRIGGERED, function():void {confirm(); });
			pconfirm.x =161+xoff;
			pconfirm.y =391;
			addChild(pconfirm);
			
			itemD = new TextField(500,150,String(item),"Assets.Pompeii",50,0x0);
			itemD.x=170+xoff;
			itemD.y=200;
			itemD.hAlign = "center";
			addChild(itemD);
			
			itemP = new TextField(683,85,String("$"+price),"Assets.Pompeii",50,0x0);
			itemP.x=330+xoff;
			itemP.y=330;
			itemP.hAlign = "left";
			addChild(itemP);
		}
		
		private function confirm():void
		{
			Starling.juggler.tween(pplate, .75, {
				x: pplate.x + xoff
			});	
			
			Starling.juggler.tween(pcancel, .75, {
				x: pcancel.x + xoff
			});	
			
			Starling.juggler.tween(pconfirm, .75, {
				x: pconfirm.x + xoff
			});	
			
			Starling.juggler.tween(itemD, .75, {
				x: itemD.x + xoff
			});
			
			Starling.juggler.tween(itemP, .75, {
				x: itemP.x + xoff
			});
			switch(buy){
				case 1:
					break;
				case 2:
					if((game.shootLevel == 0 || game.shootLevel == 1) && game.getGold() >= price){
						game.shootLevel = 2;
						game.addGold(-1*price);
					}
					break;
				case 3:
					if((game.shootLevel != 3) && game.getGold() >= price){
						game.shootLevel = 3;
						game.addGold(-1*price);
					}
					break;
				case 4:
					if((game.b1 != 1) && game.getGold() >= price){
						game.b1 = 1;
						game.addGold(-1*price);
					}
					break;
				
			}
			
			item= ""; price=0;
		}
		
		private function cancel():void
		{
			Starling.juggler.tween(pplate, .75, {
				x: pplate.x + xoff
			});	
			
			Starling.juggler.tween(pcancel, .75, {
				x: pcancel.x + xoff
			});	
			
			Starling.juggler.tween(pconfirm, .75, {
				x: pconfirm.x + xoff
			});	
			
			Starling.juggler.tween(itemD, .75, {
				x: itemD.x + xoff
			});	
			Starling.juggler.tween(itemP, .75, {
				x: itemP.x + xoff
			});	

			item= ""; price=0; buy = 0;
		}
		
		private function purchase(num:int):void
		{
			buy = num;
			itemD.text=item;
			itemP.text=String("$"+price);
			Starling.juggler.tween(pplate, .75, {
				x: 121
			});	
			
			Starling.juggler.tween(pcancel, .75, {
				x: 459
			});	
			
			Starling.juggler.tween(pconfirm, .75, {
				x: 161
			});	
			
			Starling.juggler.tween(itemD, .75, {
				x: 170
			});	
			Starling.juggler.tween(itemP, .75, {
				x: 330
			});	
		}
		
		public function update():void
		{
			num.text = String("$"+game.getGold());
		}
		
		public function destroy():void
		{
			bg.removeFromParent(true);
			bg = null;
			
			fplate.removeFromParent(true);
			fplate= null;
			
			returner.removeFromParent(true);
			returner = null;
			
			pplate.removeFromParent(true);
			pplate = null;
			
			pconfirm.removeFromParent(true);
			pconfirm = null;
			
			pcancel.removeFromParent(true);
			pcancel = null;
			
			num.removeFromParent(true);
			num = null;
			
			hero.removeFromParent(true);
			hero = null;
			
			titan.removeFromParent(true);
			titan = null;
			
			demi.removeFromParent(true);
			demi = null;
			
			itemD.removeFromParent(true);
			itemD = null;
			
			itemP.removeFromParent(true);
			itemP = null;
			
			as1.removeFromParent(true);
			as1 = null;
		}
	}
}