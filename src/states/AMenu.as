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
	import starling.utils.deg2rad;
	
	public class AMenu extends Sprite implements IState
	{
		private var game:Game;
		private var bg:Image;
		private var bgStat:Image;
		private var board:Image;
		private var tutorial:Button;
		private var hero:Button;
		private var demigod:Button;
		private var titan:Button;
		private var quit:Button;
		private var demigodL:Image;
		private var titanL:Image;
		private var menuArrow:Image;
		private var finbg:IntroBG;
		
		public var score:int;
		
		public function AMenu(game:Game)
		{
			this.game = game;
			addEventListener(Event.ADDED_TO_STAGE,init);
		}
		
		private function init():void
		{
			finbg= new IntroBG();
			finbg.alpha = 0;
			addChild(finbg);
			
			bg = new Image(Assets.RangeBGTexture);
			bg.alpha=0;
			addChild(bg);
			Starling.juggler.tween(bg, .1, {
				alpha: 100
			});
			
			bgStat = new Image(Assets.RangeStaticTexture);
			bgStat.x=-800;
			addChild(bgStat);
			Starling.juggler.tween(bgStat, .1, {
				x: 0
			});
			
			board = new Image(Assets.RangeBoardTexture);
			board.x=300;
			board.y=-5;
			addChild(board);
			Starling.juggler.tween(board, .25, {
				x: 0
			});
			
			tutorial = new Button(Assets.ArrowTTexture);
			tutorial.addEventListener(Event.TRIGGERED, toTutorial);
			tutorial.x=1287;
			tutorial.y=103;
			addChild(tutorial);
			Starling.juggler.tween(tutorial, .25, {
				x: 482
			});
			
			hero = new Button(Assets.ArrowHTexture);
			hero.addEventListener(Event.TRIGGERED, toHero);
			hero.x=1287;
			hero.y=183;
			addChild(hero);
			Starling.juggler.tween(hero, .25, {
				x: 482
			});
			
			demigod = new Button(Assets.ArrowDTexture);
			demigod.addEventListener(Event.TRIGGERED, toDemigod);
			demigod.x=1287;
			demigod.y=263;
			addChild(demigod);
			if(game.shootLevel == 2 || game.shootLevel == 3){
			Starling.juggler.tween(demigod, .25, {
				x: 482
			});
			}
			
			titan = new Button(Assets.ArrowTnTexture);
			titan.addEventListener(Event.TRIGGERED, toTitan);
			titan.x=1287;
			titan.y=343;
			addChild(titan);
			if(game.shootLevel == 3){
			Starling.juggler.tween(titan, .25, {
				x: 482
			});
			}
			
			quit = new Button(Assets.ArrowQTexture);
			quit.addEventListener(Event.TRIGGERED, toQuit);
			quit.x=1287;
			quit.y=423;
			addChild(quit);
			Starling.juggler.tween(quit, .25, {
				x: 482
			});
			
			demigodL = new Image(Assets.ArrowDLTexture);
			demigodL.x=1287;
			demigodL.y=263;
			addChild(demigodL);
			if(!(game.shootLevel == 2 || game.shootLevel == 3)){
				Starling.juggler.tween(demigodL, .25, {
					x: 482
				});
			}
			
			titanL = new Image(Assets.ArrowTnLTexture);
			titanL.x=1287;
			titanL.y=343;
			addChild(titanL);
			if(!(game.shootLevel == 3)){
				Starling.juggler.tween(titanL, .25, {
					x: 482
				});
			}
			
			menuArrow = new Image(Assets.MenuArrowTexture);
			menuArrow.x=113;
			menuArrow.y=234;
			addChild(menuArrow);

		}
		
		private function toQuit():void
		{
			Starling.juggler.tween(menuArrow, .5, {
				alpha: 0
			});	
			
			if(!(game.shootLevel == 3)){
				Starling.juggler.tween(titanL, .5, {
					alpha: 0
				});
			}else{
				Starling.juggler.tween(titan, .5, {
					alpha: 0
				});
			}
			
			if(!(game.shootLevel == 2 || game.shootLevel == 3)){
				Starling.juggler.tween(demigodL, .5, {
					alpha: 0
				});
			}else{
				Starling.juggler.tween(demigod, .5, {
					alpha: 0
				});
			}
			
			Starling.juggler.tween(quit, .5, {
				alpha: 0
			});
			
			Starling.juggler.tween(hero, .5, {
				alpha: 0
			});
			
			Starling.juggler.tween(tutorial, .5, {
				alpha: 0
			});
			
			Starling.juggler.tween(board,.5, {
				alpha: 0
			});
			
			Starling.juggler.tween(bgStat, .5, {
				alpha: 0
			});		
			
			Starling.juggler.tween(bg, .5, {
				alpha: 0
			});	
			Starling.juggler.tween(finbg, .55, {
				alpha: 100,
				onComplete: function():void { game.changeState(Game.MMENU); }
			});	
		}
		
		private function toTitan():void
		{
			looseArrow();
			Starling.juggler.tween(bgStat, .25, {
				delay:.25,
				onComplete: function():void {game.changeState(Game.AHARD); }
			});
			
			
		}
		
		private function toDemigod():void
		{
			looseArrow();
			Starling.juggler.tween(bgStat, .25, {
				delay:.3,
				onComplete: function():void {game.changeState(Game.AMED); }
			});
			
		}
		
		private function toHero():void
		{
			looseArrow();
			Starling.juggler.tween(bgStat, .25, {
				delay:.3,
				onComplete: function():void {game.changeState(Game.AEASY); }
			});
			
		}
		
		private function toTutorial():void
		{
			looseArrow();
			Starling.juggler.tween(bgStat, .25, {
				delay:.3,
				onComplete: function():void {game.changeState(Game.ATUT); }
			});
		}
		
		private function looseArrow():void
		{	
			var dtime:Number = .5;
			Starling.juggler.tween(menuArrow, .45, {
				x: 315,
				y: 180,
				rotation: deg2rad(20)
			});	
			
			if(!(game.shootLevel == 3)){
				Starling.juggler.tween(titanL, dtime, {
					x: titanL.x-800
				});
			}else{
				Starling.juggler.tween(titan, dtime, {
					x: titan.x-800
				});
			}
			
			if(!(game.shootLevel == 2 || game.shootLevel == 3)){
				Starling.juggler.tween(demigodL, dtime, {
					x: demigodL.x-800
				});
			}else{
				Starling.juggler.tween(demigod, dtime, {
					x: demigod.x-800
				});
			}
			
			Starling.juggler.tween(quit, dtime, {
				x: quit.x-800
			});
			
			Starling.juggler.tween(hero, dtime, {
				x: hero.x-800
			});
			
			Starling.juggler.tween(tutorial, dtime, {
				x: tutorial.x-800
			});
			
			Starling.juggler.tween(board, 1.05*dtime, {
				x: board.x-800
			});
			
			Starling.juggler.tween(bgStat, 1.05*dtime, {
				x: bgStat.x-800
			});
		}
		
		public function update():void
		{
		}
		
		public function destroy():void
		{
			bg.removeFromParent(true);
			bg = null;
			finbg.removeFromParent(true);
			finbg = null;
			tutorial.removeFromParent(true);
			tutorial = null;
			bgStat.removeFromParent(true);
			bgStat = null;
			board.removeFromParent(true);
			board = null;
			hero.removeFromParent(true);
			hero = null;
			quit.removeFromParent(true);
			quit = null;
			menuArrow.removeFromParent(true);
			menuArrow = null;
			titan.removeFromParent(true);
			titan = null;
			demigod.removeFromParent(true);
			demigod = null;
			titanL.removeFromParent(true);
			titanL = null;
			demigodL.removeFromParent(true);
			demigodL = null;
		}

	}
}