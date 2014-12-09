package states
{
	import core.Assets;
	import core.Game;
	
	import flash.display.Stage;
	import flash.events.MouseEvent;
	
	import interfaces.IState;
	
	import objects.Cursor;
	
	import starling.animation.Transitions;
	import starling.core.Starling;
	import starling.display.Button;
	import starling.display.DisplayObject;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.utils.deg2rad;
	import starling.text.TextField;
	
	public class AMed extends Sprite implements IState
	{
		
		private const bigS:int = 150;
		private const medS:int = 300;
		private const smlS:int = 450;
		
		private var game:Game;
		private var score:int;
		private var arrows:int;
		private var bg:Image;
		private var bgArrow:Image;
		private var bigPoles:Image;
		private var medPoles:Image;
		private var smallPoles:Image;
		private var TPos:Button;
		private var TZeu:Button;
		private var THad:Button;
		private var THera:Button;
		private var TDem:Button;
		private var THes:Button;
		private var TDio:Button;
		private var THep:Button;
		private var TArt:Button;
		private var TApo:Button;
		private var TAth:Button;
		private var TAre:Button;
		private var TAph:Button;
		private var THerm:Button;
		private var ns:Stage;
		private var marks:Array = new Array();
		private var nummarks:int = 0;
		private var backer:Image;
		private var num:TextField;
		private var numArrows:TextField;
		
		public function AMed(game:Game)
		{
			this.game = game;
			addEventListener(Event.ADDED_TO_STAGE,init);
		}
		
		private function init():void
		{
			var xoff:int = -800;
			score = 0;
			game.setScore(0);
			arrows = 10;
			bg = new Image(Assets.RangeBGTexture);
			addChild(bg);
			
			bgArrow = new Image(Assets.PlayArrowTexture);
			bgArrow.x=315-13;
			bgArrow.y=180+3;
			addChild(bgArrow);
			ns =  Starling.current.nativeStage;
			Starling.juggler.tween(bgArrow, .75, {
				transition: Transitions.EASE_IN_OUT,
				x: 667,
				y: 299,
				rotation: deg2rad(40)
			});
			

			ns.addEventListener(MouseEvent.MOUSE_DOWN, fire);

			TPos = new Button(Assets.ai.getTexture("TPos"));
			TPos.addEventListener(Event.TRIGGERED, function():void { TPos.alpha = 0; score += bigS;});
			TPos.x = 174 + xoff;
			TPos.y = 108;
			addChild(TPos);
			
			TZeu = new Button(Assets.ai.getTexture("TZeu"));
			TZeu.addEventListener(Event.TRIGGERED, function():void { TZeu.alpha = 0; score += bigS;});
			TZeu.x = 350 + xoff;
			TZeu.y = 100;
			addChild(TZeu);
			
			THad = new Button(Assets.ai.getTexture("THad"));
			THad.addEventListener(Event.TRIGGERED, function():void { THad.alpha = 0; score += bigS; arrows --;});
			THad.x = 524 + xoff;
			THad.y = 108;
			addChild(THad);
			
			Starling.juggler.tween(TPos, .75, {
				x: TPos.x - xoff
			});
			Starling.juggler.tween(TZeu, .75, {
				x: TZeu.x - xoff
			});
			Starling.juggler.tween(THad, .75, {
				x: THad.x - xoff
			});
			
			bigPoles = new Image(Assets.ai.getTexture("BigPoles"));
			bigPoles.x = 180 + xoff;
			bigPoles.y = 182;
			addChild(bigPoles);
			
			Starling.juggler.tween(bigPoles, .75, {
				x: bigPoles.x - xoff
			});
			
			THera = new Button(Assets.ai.getTexture("THera"));
			THera.addEventListener(Event.TRIGGERED, function():void { THera.alpha = 0; score += medS;});
			THera.x = 112 + xoff;
			THera.y = 202;
			addChild(THera);
			
			TDem = new Button(Assets.ai.getTexture("TDem"));
			TDem.addEventListener(Event.TRIGGERED, function():void { TDem.alpha = 0; score += medS;});
			TDem.x = 277 + xoff;
			TDem.y = 206;
			addChild(TDem);
			
			THes = new Button(Assets.ai.getTexture("THes"));
			THes.addEventListener(Event.TRIGGERED, function():void { THes.alpha = 0; score += medS;});
			THes.x = 450 + xoff;
			THes.y = 206;
			addChild(THes);
			
			TDio = new Button(Assets.ai.getTexture("TDio"));
			TDio.addEventListener(Event.TRIGGERED, function():void { TDio.alpha = 0; score += medS;});
			TDio.x = 623 + xoff;
			TDio.y = 202;
			addChild(TDio);
			
			Starling.juggler.tween(THera, .75, {
				x: THera.x - xoff
			});
			
			Starling.juggler.tween(TDem, .75, {
				x: TDem.x - xoff
			});
			
			Starling.juggler.tween(THes, .75, {
				x: THes.x - xoff
			})
			Starling.juggler.tween(TDio, .75, {
				x: TDio.x - xoff
			});
			
			medPoles = new Image(Assets.ai.getTexture("MedPoles"));
			medPoles.x = 105 + xoff;
			medPoles.y = 257;
			addChild(medPoles);
			
			Starling.juggler.tween(medPoles, .75, {
				x: medPoles.x - xoff
			});
			
			smallPoles = new Image(Assets.ai.getTexture("SmallPoles"));
			smallPoles.x = 47 + xoff;
			smallPoles.y = 372;
			addChild(smallPoles);
			Starling.juggler.tween(smallPoles, .75, {
				x: smallPoles.x - xoff
			});

			THep = new Button(Assets.ai.getTexture("THep"));
			THep.addEventListener(Event.TRIGGERED, function():void { THep.alpha = 0; score += smlS;});
			THep.x = 52 + xoff;
			THep.y = 325;
			addChild(THep);
			Starling.juggler.tween(THep, .75, {
				x: THep.x - xoff
			});
			
			TArt = new Button(Assets.ai.getTexture("TArt"));
			TArt.addEventListener(Event.TRIGGERED, function():void { TArt.alpha = 0; score += smlS;});
			TArt.x = 155 + xoff;
			TArt.y = 336;
			addChild(TArt);
			Starling.juggler.tween(TArt, .75, {
				x: TArt.x - xoff
			});
			
			TApo = new Button(Assets.ai.getTexture("TApo"));
			TApo.addEventListener(Event.TRIGGERED, function():void { TApo.alpha = 0; score += smlS;});
			TApo.x = 266 + xoff;
			TApo.y = 347;
			addChild(TApo);
			Starling.juggler.tween(TApo, .75, {
				x: TApo.x - xoff
			});
			
			TAth = new Button(Assets.ai.getTexture("TAth"));
			TAth.addEventListener(Event.TRIGGERED, function():void { TAth.alpha = 0; score += smlS;});
			TAth.x = 369 + xoff;
			TAth.y = 352;
			addChild(TAth);
			Starling.juggler.tween(TAth, .75, {
				x: TAth.x - xoff
			});
			
			TAre = new Button(Assets.ai.getTexture("TAre"));
			TAre.addEventListener(Event.TRIGGERED, function():void { TAre.alpha = 0; score += smlS;});
			TAre.x = 473 + xoff;
			TAre.y = 348;
			addChild(TAre);
			Starling.juggler.tween(TAre, .75, {
				x: TAre.x - xoff
			});
			
			TAph = new Button(Assets.ai.getTexture("TAph"));
			TAph.addEventListener(Event.TRIGGERED, function():void { TAph.alpha = 0; score += smlS;});
			TAph.x = 582 + xoff;
			TAph.y = 339;
			addChild(TAph);
			Starling.juggler.tween(TAph, .75, {
				x: TAph.x - xoff
			});
			
			THerm = new Button(Assets.ai.getTexture("THep"));
			THerm.addEventListener(Event.TRIGGERED, function():void { THerm.alpha = 0; score += smlS;});
			THerm.x = 686 + xoff;
			THerm.y = 329;
			addChild(THerm);
			Starling.juggler.tween(THerm, .75, {
				x: THerm.x - xoff
			});
			
			backer = new Image(Assets.MedBackerTexture);
			backer.x = 183;
			backer.y = -67-380;
			addChild(backer);
			
			num = new TextField(683,35,String("Score "+score),"Assets.Pompeii",20,0x0);
			num.x=550;
			num.y=-350;
			num.hAlign = "left";
			addChild(num);
			
			numArrows = new TextField(683,35,String("Arrows Remaining "+(arrows-nummarks)),"Assets.Pompeii",20,0x0);
			numArrows.x=250;
			numArrows.y=-350;
			numArrows.hAlign = "left";
			addChild(numArrows);
			
			Starling.juggler.tween(backer, 1, {
				y: backer.y+380
			});
			
			Starling.juggler.tween(num, 1, {
				y: num.y+380
			});
			
			Starling.juggler.tween(numArrows, 1, {
				y: numArrows.y+380
			});
			
		}
		
		private function fire(event:MouseEvent):void
		{
//			marks[nummarks] = new Image(Assets.AMarkTexture);
//			marks[nummarks].pivotX =25;
//			marks[nummarks].pivotY =25;
//			marks[nummarks].x =Starling.current.nativeStage.mouseX - x;
//			marks[nummarks].y =Starling.current.nativeStage.mouseY - y;
//			addChild(marks[nummarks]);
			nummarks++;
			if(nummarks > arrows)
				transOut();
		}
		
		private function transOut():void
		{
			game.setScore(score);
			var i:int;
			game.changeState(Game.AGMOR);
		}
		
		public function update():void
		{
			num.text = String("Score "+score);
			numArrows.text = String("Arrows Remaining "+(arrows-nummarks));
		}
		
		public function destroy():void
		{
			bg.removeFromParent(true);
			bg = null;
			
			bgArrow.removeFromParent(true);
			bgArrow = null;
			
			bigPoles.removeFromParent(true);
			bigPoles = null;
			
			medPoles.removeFromParent(true);
			medPoles = null;
			
			smallPoles.removeFromParent(true);
			smallPoles = null;
			
			TAph.removeFromParent(true);
			TAph = null;
			
			TApo.removeFromParent(true);
			TApo = null;
			
			TAre.removeFromParent(true);
			TAre = null;
			
			TArt.removeFromParent(true);
			TArt = null;
			
			TAth.removeFromParent(true);
			TAth = null;
			
			TDem.removeFromParent(true);
			TDem = null;
			
			TDio.removeFromParent(true);
			TDio = null;
			
			THad.removeFromParent(true);
			THad = null;
			
			THep.removeFromParent(true);
			THep = null;
			
			THera.removeFromParent(true);
			THera = null;
			
			THerm.removeFromParent(true);
			THerm = null;
			
			THes.removeFromParent(true);
			THes = null;
					
			TPos.removeFromParent(true);
			TPos = null;
			
			TZeu.removeFromParent(true);
			TZeu = null;
			
			num.removeFromParent(true);
			num = null;
			
			numArrows.removeFromParent(true);
			numArrows = null;
			
			backer.removeFromParent(true);
			backer = null;
			
			ns.removeEventListener(MouseEvent.MOUSE_DOWN, fire);

//			var i:int;
//			for(i= nummarks-1; i>0; i--)
//			{
//				marks[i].removeFromParent(true);
//				marks[i] = null;
//			}
		}
	}
}