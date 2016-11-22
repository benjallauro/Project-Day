package;

import flash.utils.Timer;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.tile.FlxTilemap;
import flixel.FlxObject;
import flixel.util.FlxTimer;
import flixel.system.FlxSound;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	var zent:Player;
	var theSky:Sky;
	var theNight:Night;
	var sign:Cartel;
	var chaser:Chaser;
	//var testBadGuy:BadGuy;
	private var tilemap:FlxTilemap;
	private var loader:FlxOgmoLoader;
	var dayTime:FlxTimer = new FlxTimer();
	var incommingDarkness:FlxTimer = new FlxTimer();
	private var cameraGuide:FlxSprite;
	var dayMusic:FlxSound;
	var newDay:FlxTimer = new FlxTimer();
	var musicDelay:FlxTimer = new FlxTimer();
	var deadCamera:FlxSprite;
	var victoryText:FlxText;
	var gameOverText:FlxText;
	var win:Bool = false;
	var firstSound:FlxSound;
	
	//var cloud1:Cloud;
	//var blackTimer:FlxTimer = new FlxTimer();
	
	
	
	//var aPlatform:TestPlatform;
	override public function create():Void
	{
		super.create();
		firstSound = new FlxSound();
		firstSound.loadEmbedded(AssetPaths.Powerup14__wav);
		firstSound.play();
		zent = new Player();
		theSky = new Sky();
		theNight = new Night();
		sign = new Cartel();
		chaser = new Chaser();
		//cloud1 = new Cloud();
		dayMusic = new FlxSound();
		dayMusic.loadEmbedded(AssetPaths.DayTheme__wav);
		dayMusic.volume = 0.1;
		//testBadGuy = new BadGuy();
		//add(testBadGuy);
		
		Reg.badGuys = new FlxTypedGroup<BadGuy>();
		Reg.spikesGroup = new FlxTypedGroup<Spikes>();
		Reg.springs = new FlxTypedGroup<Spring>();
		Reg.clouds = new FlxTypedGroup<Cloud>();
		loader = new FlxOgmoLoader(AssetPaths.Level__oel);
		tilemap = loader.loadTilemap(AssetPaths.beastlands__png, 16, 16, "Tiles");
		
		tilemap.setTileProperties(0, FlxObject.NONE);
		tilemap.setTileProperties(92, FlxObject.ANY);
		tilemap.setTileProperties(150, FlxObject.ANY);
		tilemap.setTileProperties(1424, FlxObject.ANY);
		tilemap.setTileProperties(1482, FlxObject.ANY);
		tilemap.setTileProperties(1540, FlxObject.ANY);
		tilemap.setTileProperties(1598, FlxObject.ANY);
		//tilemap.setTileProperties(1657, FlxObject.NONE);//1 a la derecha que el de arriba.
		//tilemap.setTileProperties(1715, FlxObject.NONE);
		//tilemap.setTileProperties(1773, FlxObject.NONE);
		//tilemap.setTileProperties(1831, FlxObject.NONE);
		//tilemap.setTileProperties(1889, FlxObject.NONE);
			
		loader.loadEntities(entityCreator, "Entities");
		
		FlxG.camera.setScrollBounds(0, tilemap.width, 0, tilemap.height);
		FlxG.worldBounds.set(0, 0, tilemap.width, tilemap.height);
		cameraGuide = new FlxSprite(FlxG.width / 2, FlxG.height / 2);
		cameraGuide.makeGraphic(1, 1, 0x00000000);
		cameraGuide.velocity.x = 50;
		FlxG.camera.follow(cameraGuide);
		
		deadCamera = new FlxSprite(FlxG.width / 2, FlxG.height / 2);
		deadCamera.makeGraphic(1, 1, 0x00000000);
		
		Daystart();
		
		add(cameraGuide);
		
		add(theSky);
		add(chaser);
		//cloud1.x = 500;
		//cloud1.y = 200;
		//add(cloud1);
		add(Reg.clouds);
		add(sign);
		add(zent);
		add(Reg.badGuys);
		add(Reg.spikesGroup);
		add(Reg.springs);
		add(tilemap);
		add(theNight);
		
		victoryText = new FlxText(630, 250);
		victoryText.color = 0xefff0a;
		victoryText.text = "VICTORIA";
		victoryText.scale.x = 20;
		victoryText.scale.y = 20;
		victoryText.setBorderStyle(FlxTextBorderStyle.SHADOW, 0xFF1abcc9);
		victoryText.scrollFactor.set(0, 0);
		victoryText.visible = false;
		add(victoryText);
		
		gameOverText = new FlxText(630, 250);
		gameOverText.color = 0xc20000;
		gameOverText.text = "GAME OVER";
		gameOverText.scale.x = 20;
		gameOverText.scale.y = 20;
		gameOverText.setBorderStyle(FlxTextBorderStyle.SHADOW, 0xFF1abcc9);
		gameOverText.scrollFactor.set(0, 0);
		gameOverText.visible = false;
		add(gameOverText);
		//add(gameOverText);
		
		//aPlatform = new TestPlatform();
		//add(aPlatform);
		//aPlatform.immovable = true;
	}
	private function Daystart()
	{
		theSky.morning();
		dayTime.start(20, theSky.evening, 1);
		//blackTimer.start(20, turnBlack, 1);
		incommingDarkness.start(30, theNight.appear, 1); //La diferencia de tiempo entre dayTime e Incoming darkness vendria a ser el atardecer.
		newDay.start(32.5, itsMorning, 1);
		musicDelay.start(0.5, playMusic, 1);
	}
	//private function turnBlack(Timer:FlxTimer)
	//{
	//	zent.black();
	//}
	private function itsMorning(Timer:FlxTimer)
	{
		Daystart();
	}
	private function playMusic(Timer:FlxTimer)
	{
		dayMusic.play();
	}
	private function entityCreator(entityName:String, entityData:Xml):Void
	{
		var entityStartX:Float = Std.parseFloat(entityData.get("x"));
		var entityStartY:Float = Std.parseFloat(entityData.get("y"));
		
		//	Me fijo qué tipo de entidad tengo que inicializar...
		switch(entityName)
		{
			case "BadGuy":
				    Reg.badGuys.add(new BadGuy(entityStartX, entityStartY));
			case "Spikes":
					Reg.spikesGroup.add(new Spikes(entityStartX, entityStartY));
			case "Spring":
					Reg.springs.add(new Spring(entityStartX, entityStartY));
			case "Cloud":
					Reg.clouds.add(new Cloud(entityStartX, entityStartY));

		}

	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		for (i in 0...Reg.badGuys.length)
		{
		if (FlxG.overlap(zent, Reg.badGuys.members[i]))
			{
				if ((zent.y + zent.height) > (Reg.badGuys.members[i].y + 15))
				{
					zent.damage();
					if (zent.x <= ((Reg.badGuys.members[i].x + Reg.badGuys.members[i].width / 2)))
						zent.flinchLeft();
					else
						zent.flinchRight();
				}
				else
					Reg.badGuys.members[i].death();
					zent.jump2();
			}
		}
		for (i in 0...Reg.spikesGroup.length)
		{
			if (FlxG.overlap(zent, Reg.spikesGroup.members[i])/* && Reg.spikesGroup.members[i].danger == true*/)
			{
				zent.damage();
					if (zent.x <= (Reg.spikesGroup.members[i].x + Reg.spikesGroup.members[i].width / 2))
					{
						zent.flinchLeft();
						zent.flinchUp();
					}
					else
						zent.flinchRight();
						zent.flinchUp();
				//Reg.spikesGroup.members[i].dangerOff();
			}
		}
		for (i in 0...Reg.springs.length)
		{
			if (FlxG.overlap(zent, Reg.springs.members[i]))
			{
				zent.velocity.y = -700;
				 Reg.springs.members[i].changeSprite();
				 
			}
		}
		FlxG.collide(zent, tilemap);
		for(i in 0... Reg.badGuys.members.length)
			FlxG.collide(Reg.badGuys.members[i], tilemap);
		for(i in 0... Reg.spikesGroup.members.length)
			FlxG.collide(Reg.spikesGroup.members[i], tilemap);
		//if (theNight.visible == true)
			//Daystart();
		if (zent.y > 750 && zent.alive == true)
		{
			zent.fell();
			cameraGuide.velocity.x = 0;
			gameOverText.visible = true;
		}
		if (FlxG.overlap(zent, chaser))
		{
			zent.y = 5000;
			dayMusic.stop();
			gameOverText.visible = true;
		} if (zent.alive == false)
		{
			dayMusic.stop();
			cameraGuide.velocity.x = 0;
			gameOverText.visible = true;
		}
		if (zent.x > 8970)
		{
			win = true;
		}
		if (win == true)
		{
			victoryText.visible = true;
			zent.velocity.x = 100;
			zent.velocity.y = -500;
			chaser.velocity.x = 0;
		}
		FlxG.collide(sign, tilemap);
		deadCamera.x = Reg.zentX;
	}
}
