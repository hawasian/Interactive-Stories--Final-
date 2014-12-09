package states
{
	import core.Assets;
	import core.Game;
	
	import interfaces.IState;
	
	import objects.IntroBG;
	
	import starling.core.Starling;
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	
	public class Code extends Sprite implements IState
	{
		private var game:Game;
		private var i:int = 0;
		private const offset:int = 800;
		private var bg:IntroBG;
		private var codeb:Image;
		private var coder:Button;
		private var codee:Button;
		private var code:TextField;
		private var ctext:Array = new Array('','','','','','','','','','');
		private const l:int = 6;
		private var b0:Button;
		private var b1:Button;
		private var b2:Button;
		private var b3:Button;
		private var b4:Button;
		private var b5:Button;
		private var b6:Button;
		private var b7:Button;
		private var b8:Button;
		private var b9:Button;
		private var bA:Button;
		private var bB:Button;
		private var bC:Button;
		private var bD:Button;
		private var bE:Button;
		private var bF:Button;
		private var bBack:Button;
		private var bClear:Button;
		
		public function Code(game:Game)
		{
			this.game = game;
			addEventListener(Event.ADDED_TO_STAGE,init);
		}
		
		private function init():void
		{	
			bg= new IntroBG();
			addChild(bg);

			codeb = new Image(Assets.CodeBTexture);
			codeb.x = 785;
			addChild(codeb);
			
			coder = new Button(Assets.CodeRTexture);
			coder.addEventListener(Event.TRIGGERED, onReturn);
			coder.x = 800;
			coder.y = 400;
			addChild(coder);
			
			codee = new Button(Assets.CodeETexture);
			codee.addEventListener(Event.TRIGGERED, onEnter);
			codee.x = -550;
			codee.y = 400;
			addChild(codee);
			
			code = new TextField(395,65,ctext.toString(),"Assets.Pompeii",36,0x0);
			code.hAlign = "left";
			code.x = 1200;
			code.y = 36;
			addChild(code);
			
			bClear= new Button(Assets.np.getTexture("bClear"));
			bClear.x = 560+offset;
			bClear.y = 212;
			bClear.addEventListener(Event.TRIGGERED, pClear);
			addChild(bClear);
			
			bBack= new Button(Assets.np.getTexture("bBack"));
			bBack.x = 560+offset;
			bBack.y = 128;
			bBack.addEventListener(Event.TRIGGERED, pBack);
			addChild(bBack);
			
			b0= new Button(Assets.np.getTexture("b0"));
			b0.x = 32+offset;
			b0.y = 128;
			b0.addEventListener(Event.TRIGGERED, p0);
			addChild(b0);
			
			b0= new Button(Assets.np.getTexture("b0"));
			b0.x = 32+offset;
			b0.y = 128;
			b0.addEventListener(Event.TRIGGERED, p0);
			addChild(b0);
			
			b1= new Button(Assets.np.getTexture("b1"));
			b1.x = 138+offset;
			b1.y = 128;
			b1.addEventListener(Event.TRIGGERED, p1);
			addChild(b1);
			
			b2= new Button(Assets.np.getTexture("b2"));
			b2.x = 243+offset;
			b2.y = 128;
			b2.addEventListener(Event.TRIGGERED, p2);
			addChild(b2);
			
			b3= new Button(Assets.np.getTexture("b3"));
			b3.x = 348+offset;
			b3.y = 128;
			b3.addEventListener(Event.TRIGGERED, p3);
			addChild(b3);
			
			b4= new Button(Assets.np.getTexture("b4"));
			b4.x = 453+offset;
			b4.y = 128;
			b4.addEventListener(Event.TRIGGERED, p4);
			addChild(b4);
			
			b5= new Button(Assets.np.getTexture("b5"));
			b5.x = 32+offset;
			b5.y = 212;
			b5.addEventListener(Event.TRIGGERED, p5);
			addChild(b5);
			
			b6= new Button(Assets.np.getTexture("b6"));
			b6.x = 138+offset;
			b6.y = 212;
			b6.addEventListener(Event.TRIGGERED, p6);
			addChild(b6);
			
			b7= new Button(Assets.np.getTexture("b7"));
			b7.x = 243+offset;
			b7.y = 212;
			b7.addEventListener(Event.TRIGGERED, p7);
			addChild(b7);
			
			b8= new Button(Assets.np.getTexture("b8"));
			b8.x = 348+offset;
			b8.y = 212;
			b8.addEventListener(Event.TRIGGERED, p8);
			addChild(b8);
			
			b9= new Button(Assets.np.getTexture("b9"));
			b9.x = 453+offset;
			b9.y = 212;
			b9.addEventListener(Event.TRIGGERED, p9);
			addChild(b9);
			
			bA= new Button(Assets.np.getTexture("bA"));
			bA.x = 32+offset;
			bA.y = 296;
			bA.addEventListener(Event.TRIGGERED, pA);
			addChild(bA);
			
			bB= new Button(Assets.np.getTexture("bB"));
			bB.x = 138+offset;
			bB.y = 296;
			bB.addEventListener(Event.TRIGGERED, pB);
			addChild(bB);
			
			bC= new Button(Assets.np.getTexture("bC"));
			bC.x = 243+offset;
			bC.y = 296;
			bC.addEventListener(Event.TRIGGERED, pC);
			addChild(bC);
			
			bD= new Button(Assets.np.getTexture("bD"));
			bD.x = 348+offset;
			bD.y = 296;
			bD.addEventListener(Event.TRIGGERED, pD);
			addChild(bD);
			
			bE= new Button(Assets.np.getTexture("bE"));
			bE.x = 453+offset;
			bE.y = 296;
			bE.addEventListener(Event.TRIGGERED, pE);
			addChild(bE);
			
			bF= new Button(Assets.np.getTexture("bF"));
			bF.x = 558+offset;
			bF.y = 296;
			bF.addEventListener(Event.TRIGGERED, pF);
			addChild(bF);
			
			Starling.juggler.tween(bClear, .25, {
				x: bClear.x	-offset			
			});
			Starling.juggler.tween(bBack, .25, {
				x: bBack.x	-offset			
			});
			Starling.juggler.tween(b0, .25, {
				x: b0.x	-offset			
			});
			Starling.juggler.tween(b1, .25, {
				x: b1.x	-offset			
			});
			Starling.juggler.tween(b2, .25, {
				x: b2.x	-offset			
			});
			Starling.juggler.tween(b3, .25, {
				x: b3.x	-offset			
			});
			Starling.juggler.tween(b4, .25, {
				x: b4.x	-offset			
			});
			Starling.juggler.tween(b5, .25, {
				x: b5.x	-offset			
			});
			Starling.juggler.tween(b6, .25, {
				x: b6.x	-offset			
			});
			Starling.juggler.tween(b7, .25, {
				x: b7.x	-offset			
			});
			Starling.juggler.tween(b8, .25, {
				x: b8.x	-offset			
			});
			Starling.juggler.tween(b9, .25, {
				x: b9.x	-offset			
			});
			Starling.juggler.tween(bA, .25, {
				x: bA.x	-offset			
			});
			Starling.juggler.tween(bB, .25, {
				x: bB.x	-offset			
			});
			Starling.juggler.tween(bC, .25, {
				x: bC.x	-offset			
			});
			Starling.juggler.tween(bD, .25, {
				x: bD.x	-offset			
			});
			Starling.juggler.tween(bE, .25, {
				x: bE.x	-offset			
			});
			Starling.juggler.tween(bF, .25, {
				x: bF.x	-offset			
			});
			Starling.juggler.tween(codeb, .25, {
				x: 0				
			});
			
			Starling.juggler.tween(code, .25, {
				x: 375				
			});
			
			Starling.juggler.tween(coder, .25, {
				x: 415
			});
			
			Starling.juggler.tween(codee, .25, {
				x: -150
			});
		}
		
		private function p0():void
		{
			if(i<l){
				ctext[i] = '0';
				i++;
			}
		}
		
		private function p1():void
		{
			if(i<l){
				ctext[i] = '1';
				i++;
			}
		}
		private function p2():void
		{
			if(i<l){
				ctext[i] = '2';
				i++;
			}
		}
		private function p3():void
		{
			if(i<l){
				ctext[i] = '3';
				i++;
			}
		}
		private function p4():void
		{
			if(i<l){
				ctext[i] = '4';
				i++;
			}
		}
		private function p5():void
		{
			if(i<l){
				ctext[i] = '5';
				i++;
			}
		}
		private function p6():void
		{
			if(i<l){
				ctext[i] = '6';
				i++;
			}
		}
		private function p7():void
		{
			if(i<l){
				ctext[i] = '7';
				i++;
			}
		}
		private function p8():void
		{
			if(i<l){
				ctext[i] = '8';
				i++;
			}
		}
		private function p9():void
		{
			if(i<l){
				ctext[i] = '9';
				i++;
			}
		}
		private function pA():void
		{
			if(i<l){
				ctext[i] = 'A';
				i++;
			}
		}
		private function pB():void
		{
			if(i<l){
				ctext[i] = 'B';
				i++;
			}
		}
		private function pC():void
		{
			if(i<l){
				ctext[i] = 'C';
				i++;
			}
		}
		private function pD():void
		{
			if(i<l){
				ctext[i] = 'D';
				i++;
			}
		}
		private function pE():void
		{
			if(i<l){
				ctext[i] = 'E';
				i++;
			}
		}
		private function pF():void
		{
			if(i<l){
				ctext[i] = 'F';
				i++;
			}
		}
		private function pBack():void
		{
			if(i>0){
				i--;
			}
			ctext[i] = '';
		}
		private function pClear():void
		{
			var j:int;
			for(j = l; j>=0; j--)
			{
				ctext[j] = '';
			}
			i = 0;
		}
		
		private function onEnter():void
		{
			if(code.text.length == l){
				game.setCode(code.text);
			}
			game.shootLevel = parseInt((ctext[1]));
			game.setBookLevel(String(ctext[0]+ctext[2]));
			var g1:String = (ctext[3]);
			var g2:String = (ctext[4]);
			var g3:String = (ctext[5]);
			var i1:int;
			var i2:int;
			var i3:int;
			switch(g1)
			{
				case "A":
					i1 = 10;
					break;
				case "B":
					i1 = 11;
					break;
				case "C":
					i1 = 12;
					break;
				case "D":
					i1 = 13;
					break;
				case "E":
					i1 = 14;
					break;
				case "F":
					i1 = 15;
					break;
				default:
					i1 = parseInt(g1);
					break;	
			}
			switch(g2)
			{
				case "A":
					i2 = 10;
					break;
				case "B":
					i2 = 11;
					break;
				case "C":
					i2 = 12;
					break;
				case "D":
					i2 = 13;
					break;
				case "E":
					i2 = 14;
					break;
				case "F":
					i2 = 15;
					break;
				default:
					i2 = parseInt(g2);
					break;	
			}
			switch(g3)
			{
				case "A":
					i3 = 10;
					break;
				case "B":
					i3 = 11;
					break;
				case "C":
					i3 = 12;
					break;
				case "D":
					i3 = 13;
					break;
				case "E":
					i3 = 14;
					break;
				case "F":
					i3 = 15;
					break;
				default:
					i3 = parseInt(g3);
					break;	
			}
			game.setGold(i1*256+i2*16+i3);

			hidepad();
			Starling.juggler.tween(codeb, .25, {
				x: -785				
			});
			
			Starling.juggler.tween(coder, .25, {
				x: 1000
			});
			
			Starling.juggler.tween(codee, .5, {
				x: -550
			});		
			
			Starling.juggler.tween(bg,1.0, {
				alpha:0,
				onComplete: function():void { game.changeState(Game.MMENU); }
			});
		}
		
		private function onReturn():void
		{
			hidepad();
			Starling.juggler.tween(codeb, .25, {
				x: 800				
			});
			
			Starling.juggler.tween(coder, .5, {
				onComplete: function():void { game.changeState(Game.TMENU); },
				x: 1000
			});
			
			Starling.juggler.tween(codee, .25, {
				//onComplete: function():void { game.changeState(Game.MMENU); },
				x: -550
			});			
		}
		
		private function hidepad():void
		{
			Starling.juggler.tween(bClear, .1, {alpha:0});
			Starling.juggler.tween(bBack, .1, {alpha:0});
			Starling.juggler.tween(b0, .1, {alpha:0});
			Starling.juggler.tween(b1, .1, {alpha:0});
			Starling.juggler.tween(b2, .1, {alpha:0});
			Starling.juggler.tween(b3, .1, {alpha:0});
			Starling.juggler.tween(b4, .1, {alpha:0});
			Starling.juggler.tween(b5, .1, {alpha:0});
			Starling.juggler.tween(b6, .1, {alpha:0});
			Starling.juggler.tween(b7, .1, {alpha:0});
			Starling.juggler.tween(b8, .1, {alpha:0});
			Starling.juggler.tween(b9, .1, {alpha:0});
			Starling.juggler.tween(bA, .1, {alpha:0});
			Starling.juggler.tween(bB, .1, {alpha:0});
			Starling.juggler.tween(bC, .1, {alpha:0});
			Starling.juggler.tween(bD, .1, {alpha:0});
			Starling.juggler.tween(bE, .1, {alpha:0});
			Starling.juggler.tween(bF, .1, {alpha:0});
			Starling.juggler.tween(code, .1, {alpha:0})
		}
		
		public function update():void
		{
			code.text = (ctext[0].toString()+ctext[1].toString()+ctext[2].toString()+ctext[3].toString()+ctext[4].toString()
				+ctext[5].toString());
		}
		
		public function destroy():void
		{
			bg.removeFromParent(true);
			bg = null;
			
			codeb.removeFromParent(true);
			codeb = null;
			
			coder.removeFromParent(true);
			coder = null;
			
			codee.removeFromParent(true);
			codee = null;
			
			b0.removeFromParent(true);
			b0 = null;
			
			b1.removeFromParent(true);
			b1 = null;
			
			b2.removeFromParent(true);
			b2 = null;
			
			b3.removeFromParent(true);
			b3 = null;
			
			b4.removeFromParent(true);
			b4 = null;
			
			b5.removeFromParent(true);
			b5 = null;
			
			b6.removeFromParent(true);
			b6 = null;
			
			b7.removeFromParent(true);
			b7 = null;
			
			b8.removeFromParent(true);
			b8 = null;
			
			b9.removeFromParent(true);
			b9 = null;
			
			bA.removeFromParent(true);
			bA = null;
			
			bB.removeFromParent(true);
			bB = null;
			
			bC.removeFromParent(true);
			bC = null;
			
			bD.removeFromParent(true);
			bD = null;
			
			bE.removeFromParent(true);
			bE = null;
			
			bF.removeFromParent(true);
			bF = null;
			
			bBack.removeFromParent(true);
			bBack = null;
			
			bClear.removeFromParent(true);
			bClear = null;
			
			code.removeFromParent(true);
			code = null;
			
			ctext = null;
		}
	}
}