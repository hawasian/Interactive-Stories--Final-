package core
{
	import interfaces.IState;
	
	import starling.display.Sprite;
	import starling.events.Event;
	
	import states.AEasy;
	import states.AGameOver;
	import states.AHard;
	import states.AMed;
	import states.AMenu;
	import states.ATutorial;
	import states.Code;
	import states.Credit;
	import states.Intro;
	import states.MMenu;
	import states.MOptions;
	import states.OMenu;
	import states.QGameOver;
	import states.QMenu;
	import states.QPaL;
	import states.QPlay;
	import states.SGameOver;
	import states.SMenu;
	import states.SPaS;
	import states.SRead;
	import states.Store;
	import states.TMenu;
	
	public class Game extends Sprite
	{
		public static const CREDIT:int = 0;
		public static const INTRO:int = 1;
		public static const TMENU:int = 2;
		public static const CODE:int = 3;
		public static const MMENU:int = 4;
		public static const STORE:int = 5;
		public static const SMENU:int = 6;
		public static const QMENU:int = 7;
		public static const AMENU:int = 8;
		public static const OMENU:int = 9;
		public static const AEASY:int = 10;
		public static const AMED:int = 11;
		public static const AHARD:int = 12;
		public static const AGMOR:int = 13;
		public static const QPAL:int = 14;
		public static const QPLAY:int = 15;
		public static const QGMOR:int = 16;
		public static const SPAS:int = 17;
		public static const SREAD:int = 18;
		public static const SGMOR:int = 19;
		public static const MMOPT:int = 20;
		public static const ATUT:int = 21;
		
		public static const MEDUSA:int = 1;
		
		private var cs:IState;

		private var code:String = "000000";
		private var gold:int = 0;
		
		public var aScore:int;
		
		public var menuSwitcher:int = 1;

		
		public var shootLevel:int = 0;
		public var storyLevel:String = String(00);
		public var book:int = 0;
		
		public var b1:int=0;
		public var b2:int=0;
		public var b3:int=0;
		public var b4:int=0;
		public var b5:int=0;
		public var b6:int=0;
		public var b7:int=0;
		public var b8:int=0;
		
		public function Game()
		{
			Assets.init();
			addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(event:Event):void
		{
			changeState(INTRO);
			addEventListener(Event.ENTER_FRAME,update);
		}
		
		public function changeState(n:int):void
		{	
			if(cs != null)
			{
				cs.destroy();
				cs = null;
			}
			switch(n)
			{
				case CREDIT:
					cs = new Credit(this);
					break;
				case INTRO:
					cs = new Intro(this);
					break;
				case TMENU:
					cs = new TMenu(this);
					break;
				case CODE:
					cs = new Code(this);
					break;
				case MMENU:
					cs = new MMenu(this);
					break;
				case STORE:
					cs = new Store(this);
					break;
				case SMENU:
					cs = new SMenu(this);
					break;
				case QMENU:
					cs = new QMenu(this);
					break;
				case AMENU:
					cs = new AMenu(this);
					break;
				case OMENU:
					cs = new OMenu(this);
					break;
				case AEASY:
					cs = new AEasy(this);
					break;
				case AMED:
					cs = new AMed(this);
					break;
				case AHARD:
					cs = new AHard(this);
					break;
				case AGMOR:
					cs = new AGameOver(this);
					break;
				case QPAL:
					cs = new QPaL(this);
					break;
				case QPLAY:
					cs = new QPlay(this);
					break;
				case QGMOR:
					cs = new QGameOver(this);
					break;
				case SPAS:
					cs = new SPaS(this);
					break;
				case SREAD:
					cs = new SRead(this);
					break;
				case SGMOR:
					cs = new SGameOver(this);
					break;
				case MMOPT:
					cs = new MOptions(this);
					break;
				case ATUT:
					cs = new ATutorial(this);
					break;
			}
			addChild(Sprite(cs));
		}
		
		public function getCode():String
		{
			return code;
		}
		
		public function setCode(n:String):void
		{
			code = n;
		}
		
		public function getGold():int
		{
			return gold;
		}
		
		public function addGold(n:int):void
		{
			gold += n;
		}
		
		public function setGold(n:int):void
		{
			gold = n;
		}
		
		private function update():void
		{
			cs.update();
		}
		
		public function getScore():int
		{
			return aScore;
		}
		public function setScore(n:int):void
		{
			aScore = n;
		}
		public function addScore(n:int):void
		{
			aScore += n;
		}
		
		public function getBook():int
		{
			return book;
		}
		
		public function setBook(n:int):void
		{
			book = n;
		}
		
		public function setBookLevel(s:String):void
		{
			var c1:String=s.charAt(0);
			var c2:String=s.charAt(1);
			var i1:int;
			var i2:int;
			
			var total:int;
			
			switch(c1)
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
					i1 = parseInt(c1);
					break;
			}
			switch(c2)
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
					i2 = parseInt(c2);
					break;
			}
			if(i1>=8)
			{
				b8 =1;
				i1 -= 8;
			}else{
				b8 =0;
			}
			if(i1>=4)
			{
				b7 =1;
				i1 -= 4;
			}else{
				b7=0;
			}
			if(i1>=2)
			{
				b6 =1;
				i1 -= 2;
			}else{
				b6=0;
			}
			if(i1>=1)
			{
				b5 =1;
				i1 -= 1;
			}else{
				b5=0;
			}
			
			if(i2>=8)
			{
				b4 =1;
				i2 -= 8;
			}else{
				b4 =0;
			}
			if(i2>=4)
			{
				b3 =1;
				i2 -= 4;
			}else{
				b3=0;
			}
			if(i2>=2)
			{
				b2 =1;
				i2 -= 2;
			}else{
				b2=0;
			}
			if(i2>=1)
			{
				b1 =1;
				i2 -= 1;
			}else{
				b1=0;
			}
		}
		public function getStoryLevel():String
		{
			var i1:int = b8*8 +b7*4 +b6*2 +b5;
			var i2:int = b4*8 +b3*4 +b2*2 +b1;
			var c1:String;
			var c2:String;
			
			switch(i1)
			{
				case 15:
					c1 = "F";
					break;
				case 14:
					c1 = "E";
					break;
				case 13:
					c1 = "D";
					break;
				case 12:
					c1 = "C";
					break;
				case 11:
					c1 = "B";
					break;
				case 10:
					c1 = "A";
					break;
				default:
					c1 = String(i1);
					break;
			}
			switch(i2)
			{
				case 15:
					c2 = "F";
					break;
				case 14:
					c2 = "E";
					break;
				case 13:
					c2 = "D";
					break;
				case 12:
					c2 = "C";
					break;
				case 11:
					c2 = "B";
					break;
				case 10:
					c2 = "A";
					break;
				default:
					c2 = String(i2);
					break;
			}
			
			return c1+c2;
		}
	}
}