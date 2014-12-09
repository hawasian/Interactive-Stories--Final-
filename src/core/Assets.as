package core
{
	import starling.text.BitmapFont;
	import starling.text.TextField;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;


	public class Assets
	{
		[Embed(source="assets/DIOGENES.ttf", embedAsCFF="false",fontName="DIOGENES")]
		public static const DIOGENES:Class;
		
		[Embed(source="assets/PompejiPetit.ttf", embedAsCFF="false",fontName="Pompeii")]
		public static const Pompeii:Class;
		
		[Embed(source="assets/PoseiAOE.ttf", embedAsCFF="false",fontName="Poseidon")]
		public static const Poseidon:Class;
		
		[Embed(source="assets/Archeologicaps.ttf", embedAsCFF="false",fontName="Archeologicaps")]
		public static const Archeologicaps:Class;
		
		[Embed(source="assets/coinage.png")]
		private static var coinage:Class;
		public static var coinTexture:Texture;
		
		[Embed(source="assets/WaveBG.png")]
		private static var WaveBG:Class;
		public static var WaveBGTexture:Texture;
		
		[Embed(source="assets/TitlePlate.png")]
		private static var Plate:Class;
		public static var TPTexture:Texture;
		
		[Embed(source="assets/SButtonUp.png")]
		private static var SBU:Class;
		public static var SBUTexture:Texture;
		
		[Embed(source="assets/MMenuBox.png")]
		private static var MMB:Class;
		public static var MMBTexture:Texture;
		
		[Embed(source="assets/MMLoad.png")]
		private static var MML:Class;
		public static var MMLTexture:Texture;
		
		[Embed(source="assets/MMNew.png")]
		private static var MMN:Class;
		public static var MMNTexture:Texture;
		
		[Embed(source="assets/MMCredits.png")]
		private static var MMC:Class;
		public static var MMCTexture:Texture;
		
		[Embed(source="assets/CodeBox.png")]
		private static var CodeB:Class;
		public static var CodeBTexture:Texture;
		
		[Embed(source="assets/CodeReturn.png")]
		private static var CodeR:Class;
		public static var CodeRTexture:Texture;
		
		[Embed(source="assets/CodeEnter.png")]
		private static var CodeE:Class;
		public static var CodeETexture:Texture;
		//Credits
		[Embed(source="assets/CreditsBox.png")]
		private static var CreditB:Class;
		public static var CreditBTexture:Texture;
		
		[Embed(source="assets/numpad.png")]
		private static var numpad:Class;
		
		public static var np:TextureAtlas;
		
		[Embed(source="assets/numpad.xml", mimeType="application/octet-stream")]
		private static var numpadXML:Class;
		//MainMenu
		[Embed(source="assets/CampMap.png")]
		private static var CM:Class;
		public static var CMTexture:Texture;
		
		[Embed(source="assets/MapSprites.png")]
		private static var mapsprites:Class;
		
		public static var ms:TextureAtlas;
		
		[Embed(source="assets/MapSprites.xml", mimeType="application/octet-stream")]
		private static var mapspritesXML:Class;
		//Options	
		[Embed(source="assets/Options Map.png")]
		private static var OM:Class;
		public static var OMTexture:Texture;
		
		[Embed(source="assets/MMOptionsPlate.png")]
		private static var MMopPlate:Class;
		public static var MMopPlateTexture:Texture;
		
		[Embed(source="assets/MMOQuit.png")]
		private static var MMOQuit:Class;
		public static var MMOQuitTexture:Texture;
		
		[Embed(source="assets/MMOReturn.png")]
		private static var MMOReturn:Class;
		public static var MMOReturnTexture:Texture;
		//Range
		[Embed(source="assets/RangeBG.png")]
		private static var RangeBG:Class;
		public static var RangeBGTexture:Texture;
		
		[Embed(source="assets/RangeStatic.png")]
		private static var RangeStatic:Class;
		public static var RangeStaticTexture:Texture;
		
		[Embed(source="assets/RangeBoard.png")]
		private static var RangeBoard:Class;
		public static var RangeBoardTexture:Texture;
		
		[Embed(source="assets/ArrowT.png")]
		private static var ArrowT:Class;
		public static var ArrowTTexture:Texture;
		
		[Embed(source="assets/ArrowH.png")]
		private static var ArrowH:Class;
		public static var ArrowHTexture:Texture;
		
		[Embed(source="assets/ArrowD.png")]
		private static var ArrowD:Class;
		public static var ArrowDTexture:Texture;
		
		[Embed(source="assets/ArrowTn.png")]
		private static var ArrowTn:Class;
		public static var ArrowTnTexture:Texture;
		
		[Embed(source="assets/ArrowDL.png")]
		private static var ArrowDL:Class;
		public static var ArrowDLTexture:Texture;
		
		[Embed(source="assets/ArrowTnL.png")]
		private static var ArrowTnL:Class;
		public static var ArrowTnLTexture:Texture;
		
		[Embed(source="assets/ArrowQ.png")]
		private static var ArrowQ:Class;
		public static var ArrowQTexture:Texture;
		
		[Embed(source="assets/MenuArrow.png")]
		private static var MenuArrow:Class;
		public static var MenuArrowTexture:Texture;
		
		[Embed(source="assets/PlayArrow.png")]
		private static var PlayArrow:Class;
		public static var PlayArrowTexture:Texture;
		
		[Embed(source="assets/bullseyeE.png")]
		private static var BullseyeE:Class;
		public static var BullseyeETexture:Texture;
		
		[Embed(source="assets/ACursor.png")]
		private static var ACursor:Class;
		public static var ACursorTexture:Texture;
		
		[Embed(source="assets/AMark.png")]
		private static var AMark:Class;
		public static var AMarkTexture:Texture;
		
		[Embed(source="assets/AScoreBack.png")]
		private static var AScoreBack:Class;
		public static var AScoreBackTexture:Texture
		
		[Embed(source="assets/AGMPlate.png")]
		private static var AGMPlate:Class;
		public static var AGMPlateTexture:Texture
		
		[Embed(source="assets/AGMAgain.png")]
		private static var AGMAgain:Class;
		public static var AGMAgainTexture:Texture
		
		[Embed(source="assets/AGMReturn.png")]
		private static var AGMReturn:Class;
		public static var AGMReturnTexture:Texture
		
		//AINT
		[Embed(source="assets/MedBacker.png")]
		private static var MedBacker:Class;
		public static var MedBackerTexture:Texture
		
		[Embed(source="assets/AInt.png")]
		private static var aInt:Class;
		
		public static var ai:TextureAtlas;
		
		[Embed(source="assets/AInt.xml", mimeType="application/octet-stream")]
		private static var aIntXML:Class;
		
		[Embed(source="assets/TStraw1.png")]
		private static var TStraw:Class;
		public static var TStrawTexture:Texture
		
		[Embed(source="assets/AWall.png")]
		private static var AWall:Class;
		public static var AWallTexture:Texture
		
		[Embed(source="assets/ATbook.png")]
		private static var ATbook:Class;
		
		public static var atb:TextureAtlas;
		
		[Embed(source="assets/ATbook.xml", mimeType="application/octet-stream")]
		private static var ATbookXML:Class;
		
		[Embed(source="assets/AmphiBG.png")]
		private static var AmphiBG:Class;
		public static var AmphiBGTexture:Texture;
		//books
		[Embed(source="assets/book0.png")]
		private static var book0:Class;
		
		public static var b0:TextureAtlas;
		
		[Embed(source="assets/book0.xml", mimeType="application/octet-stream")]
		private static var book0XML:Class;
		
		[Embed(source="assets/q0.png")]
		private static var quest0:Class;
		
		public static var q0:TextureAtlas;
		
		[Embed(source="assets/q0.xml", mimeType="application/octet-stream")]
		private static var quest0XML:Class;
		
		[Embed(source="assets/book1.png")]
		private static var book1:Class;
		
		public static var b1:TextureAtlas;
		
		[Embed(source="assets/book1.xml", mimeType="application/octet-stream")]
		private static var book1XML:Class;
		
		[Embed(source="assets/q1.png")]
		private static var quest1:Class;
		
		public static var q1:TextureAtlas;
		
		[Embed(source="assets/q1.xml", mimeType="application/octet-stream")]
		private static var quest1XML:Class;
		//Curtains
		[Embed(source="assets/CurtainTop.png")]
		private static var CurtainTop:Class;
		public static var CurtainTopTexture:Texture;
		
		[Embed(source="assets/CurtainLeft.png")]
		private static var CurtainLeft:Class;
		public static var CurtainLeftTexture:Texture;
		
		[Embed(source="assets/CurtainRight.png")]
		private static var CurtainRight:Class;
		public static var CurtainRightTexture:Texture;
		
		[Embed(source="assets/AmphiPlate.png")]
		private static var AmphiPlate:Class;
		public static var AmphiPlateTexture:Texture;
		
		[Embed(source="assets/AmphiReturn.png")]
		private static var AmphiReturn:Class;
		public static var AmphiReturnTexture:Texture;
		
		[Embed(source="assets/AmphiUp.png")]
		private static var AmphiUp:Class;
		public static var AmphiUpTexture:Texture;
		
		[Embed(source="assets/AmphiDown.png")]
		private static var AmphiDown:Class;
		public static var AmphiDownTexture:Texture;
		
		[Embed(source="assets/AmphiBoard.png")]
		private static var AmphiBoard:Class;
		public static var AmphiBoardTexture:Texture;
		
		[Embed(source="assets/AmphiBoardTop.png")]
		private static var AmphiBT:Class;
		public static var AmphiBTTexture:Texture;
		
		[Embed(source="assets/AmphiBoardSide.png")]
		private static var AmphiBS:Class;
		public static var AmphiBSTexture:Texture;
		
		[Embed(source="assets/AmphiBoardBtm.png")]
		private static var AmphiBB:Class;
		public static var AmphiBBTexture:Texture;
		
		[Embed(source="assets/AmphiBacker.png")]
		private static var AmphiBacker:Class;
		public static var AmphiBackerTexture:Texture;
		
		[Embed(source="assets/AmphB1.png")]
		private static var AmphB1:Class;
		public static var AmphB1Texture:Texture;
		
		[Embed(source="assets/AmphB0.png")]
		private static var AmphB0:Class;
		public static var AmphB0Texture:Texture;
		
		[Embed(source="assets/StoryWrapper.png")]
		private static var SWrap:Class;
		public static var SWrapTexture:Texture;
		
		[Embed(source="assets/StNext.png")]
		private static var StNext:Class;
		public static var StNextTexture:Texture;
		
		[Embed(source="assets/StBack.png")]
		private static var StBack:Class;
		public static var StBackTexture:Texture;
		
		[Embed(source="assets/StClose.png")]
		private static var StClose:Class;
		public static var StCloseTexture:Texture;
		
		[Embed(source="assets/OrBG.png")]
		private static var QBG:Class;
		public static var QBGTexture:Texture;
		
		[Embed(source="assets/QBoard.png")]
		private static var QBoard:Class;
		public static var QBoardTexture:Texture;
		
		[Embed(source="assets/QBTop.png")]
		private static var QBTop:Class;
		public static var QBTopTexture:Texture;
		
		[Embed(source="assets/QBBtm.png")]
		private static var QBBtm:Class;
		public static var QBBtmTexture:Texture;
		
		[Embed(source="assets/QBSide.png")]
		private static var QBSide:Class;
		public static var QBSideTexture:Texture;
		
		[Embed(source="assets/QMPlate.png")]
		private static var QMPlate:Class;
		public static var QMPlateTexture:Texture;
		
		[Embed(source="assets/QBReturn.png")]
		private static var QBReturn:Class;
		public static var QBReturnTexture:Texture;
		
		[Embed(source="assets/QB0.png")]
		private static var QB0:Class;
		public static var QB0Texture:Texture;
		
		[Embed(source="assets/QB1.png")]
		private static var QB1:Class;
		public static var QB1Texture:Texture;
		
		[Embed(source="assets/QuizUp.png")]
		private static var QUp:Class;
		public static var QUpTexture:Texture;
		
		[Embed(source="assets/QuizDown.png")]
		private static var QDn:Class;
		public static var QDnTexture:Texture;
		
		[Embed(source="assets/ArmBG.png")]
		private static var ArmBG:Class;
		public static var ArmBGTexture:Texture;
		
		[Embed(source="assets/ArmFunds.png")]
		private static var ArmFunds:Class;
		public static var ArmFundsTexture:Texture;
		
		[Embed(source="assets/ArmReturn.png")]
		private static var ArmReturn:Class;
		public static var ArmReturnTexture:Texture;
		
		[Embed(source="assets/ArmHero.png")]
		private static var ArmHero:Class;
		public static var ArmHeroTexture:Texture;
		
		[Embed(source="assets/ArmDG.png")]
		private static var ArmDG:Class;
		public static var ArmDGTexture:Texture;
		
		[Embed(source="assets/ArmTitan.png")]
		private static var ArmTitan:Class;
		public static var ArmTitanTexture:Texture;
		
		[Embed(source="assets/ArmPPlate.png")]
		private static var ArmPPlate:Class;
		public static var ArmPPlateTexture:Texture;
		
		[Embed(source="assets/ArmPConfirm.png")]
		private static var ArmPConfirm:Class;
		public static var ArmPConfirmTexture:Texture;
		
		[Embed(source="assets/ArmPCancel.png")]
		private static var ArmPCancel:Class;
		public static var ArmPCancelTexture:Texture;
		
		[Embed(source="assets/AS1.png")]
		private static var AS1:Class;
		public static var AS1Texture:Texture;
		
		[Embed(source="assets/QPFrame.png")]
		private static var QFrame:Class;
		public static var QFrameTexture:Texture;
		
		public static function init():void
		{
			coinTexture = Texture.fromBitmap(new coinage());
			WaveBGTexture = Texture.fromBitmap(new WaveBG());
			TPTexture = Texture.fromBitmap(new Plate());
			SBUTexture = Texture.fromBitmap(new SBU());
			MMBTexture = Texture.fromBitmap(new MMB());
			MMLTexture = Texture.fromBitmap(new MML());
			MMNTexture = Texture.fromBitmap(new MMN());
			MMCTexture = Texture.fromBitmap(new MMC());
			CodeBTexture = Texture.fromBitmap(new CodeB());
			CodeRTexture = Texture.fromBitmap(new CodeR());
			CodeETexture = Texture.fromBitmap(new CodeE());
			CreditBTexture = Texture.fromBitmap(new CreditB());
			CMTexture = Texture.fromBitmap(new CM());
			OMTexture = Texture.fromBitmap(new OM());
			MMopPlateTexture = Texture.fromBitmap(new MMopPlate());
			MMOQuitTexture = Texture.fromBitmap(new MMOQuit());
			MMOReturnTexture = Texture.fromBitmap(new MMOReturn());
			RangeBGTexture = Texture.fromBitmap(new RangeBG());
			RangeStaticTexture = Texture.fromBitmap(new RangeStatic());
			RangeBoardTexture = Texture.fromBitmap(new RangeBoard());
			ArrowTTexture = Texture.fromBitmap(new ArrowT());
			ArrowDTexture = Texture.fromBitmap(new ArrowD());
			ArrowDLTexture = Texture.fromBitmap(new ArrowDL());
			ArrowHTexture = Texture.fromBitmap(new ArrowH());
			ArrowTnTexture = Texture.fromBitmap(new ArrowTn());
			ArrowTnLTexture = Texture.fromBitmap(new ArrowTnL());
			ArrowQTexture = Texture.fromBitmap(new ArrowQ());
			MenuArrowTexture = Texture.fromBitmap(new MenuArrow());
			PlayArrowTexture = Texture.fromBitmap(new PlayArrow());
			BullseyeETexture = Texture.fromBitmap(new BullseyeE());
			ACursorTexture = Texture.fromBitmap(new ACursor());
			AMarkTexture = Texture.fromBitmap(new AMark());
			AScoreBackTexture = Texture.fromBitmap(new AScoreBack());
			AGMPlateTexture = Texture.fromBitmap(new AGMPlate());
			AGMAgainTexture = Texture.fromBitmap(new AGMAgain());
			AGMReturnTexture = Texture.fromBitmap(new AGMReturn());
			MedBackerTexture = Texture.fromBitmap(new MedBacker());
			TStrawTexture = Texture.fromBitmap(new TStraw());
			AWallTexture = Texture.fromBitmap(new AWall());
			CurtainTopTexture = Texture.fromBitmap(new CurtainTop());
			CurtainLeftTexture = Texture.fromBitmap(new CurtainLeft());
			CurtainRightTexture = Texture.fromBitmap(new CurtainRight());
			AmphiBGTexture = Texture.fromBitmap(new AmphiBG());
			QBGTexture = Texture.fromBitmap(new QBG());			
			AmphiPlateTexture = Texture.fromBitmap(new AmphiPlate());
			AmphiReturnTexture = Texture.fromBitmap(new AmphiReturn());
			AmphiUpTexture = Texture.fromBitmap(new AmphiUp());
			AmphiDownTexture = Texture.fromBitmap(new AmphiDown());
			AmphiBackerTexture = Texture.fromBitmap(new AmphiBacker());
			AmphiBoardTexture = Texture.fromBitmap(new AmphiBoard());
			AmphiBTTexture = Texture.fromBitmap(new AmphiBT());
			AmphiBBTexture = Texture.fromBitmap(new AmphiBB());
			AmphiBSTexture = Texture.fromBitmap(new AmphiBS());
			QBoardTexture = Texture.fromBitmap(new QBoard());
		
			AmphB1Texture = Texture.fromBitmap(new AmphB1());
			AmphB0Texture = Texture.fromBitmap(new AmphB0());

			QFrameTexture = Texture.fromBitmap(new QFrame());
			QBTopTexture = Texture.fromBitmap(new QBTop());
			QUpTexture = Texture.fromBitmap(new QUp());
			QDnTexture = Texture.fromBitmap(new QDn());

			QBBtmTexture = Texture.fromBitmap(new QBBtm());
			QBSideTexture = Texture.fromBitmap(new QBSide());
			QBReturnTexture = Texture.fromBitmap(new QBReturn());
			QMPlateTexture = Texture.fromBitmap(new QMPlate());
			SWrapTexture = Texture.fromBitmap(new SWrap());
			StBackTexture = Texture.fromBitmap(new StBack());
			StCloseTexture = Texture.fromBitmap(new StClose());
			StNextTexture = Texture.fromBitmap(new StNext());
			QB0Texture = Texture.fromBitmap(new QB0());
			QB1Texture = Texture.fromBitmap(new QB1());
			
			ArmBGTexture = Texture.fromBitmap(new ArmBG());			
			ArmFundsTexture = Texture.fromBitmap(new ArmFunds());			
			ArmReturnTexture = Texture.fromBitmap(new ArmReturn());		
			
			ArmDGTexture = Texture.fromBitmap(new ArmDG());
			ArmHeroTexture = Texture.fromBitmap(new ArmHero());
			ArmTitanTexture = Texture.fromBitmap(new ArmTitan());
			ArmPPlateTexture = Texture.fromBitmap(new ArmPPlate());
			ArmPConfirmTexture = Texture.fromBitmap(new ArmPConfirm());
			ArmPCancelTexture = Texture.fromBitmap(new ArmPCancel());
			AS1Texture = Texture.fromBitmap(new AS1());

			np = new TextureAtlas(Texture.fromBitmap(new numpad()),
				XML(new numpadXML()));
			
			ms = new TextureAtlas(Texture.fromBitmap(new mapsprites()),
				XML(new mapspritesXML()));
			
			ai = new TextureAtlas(Texture.fromBitmap(new aInt()),
				XML(new aIntXML()));
			
			atb = new TextureAtlas(Texture.fromBitmap(new ATbook()),
				XML(new ATbookXML()));
			
			b0 = new TextureAtlas(Texture.fromBitmap(new book0()),
				XML(new book0XML()));
			
			q0 = new TextureAtlas(Texture.fromBitmap(new quest0()),
				XML(new quest0XML()));
			
			q1 = new TextureAtlas(Texture.fromBitmap(new quest1()),
				XML(new quest1XML()));
			
			b1 = new TextureAtlas(Texture.fromBitmap(new book1()),
				XML(new book1XML()));
		}
	}
}