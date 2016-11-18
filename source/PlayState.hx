package;

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

class PlayState extends FlxState
{
	var zent:Player;
	var theSky:Sky;
	var theNight:Night;
	//var testBadGuy:BadGuy;
	private var tilemap:FlxTilemap;
	private var loader:FlxOgmoLoader;
	var dayTime:FlxTimer = new FlxTimer();
	var incommingDarkness:FlxTimer = new FlxTimer();
	private var cameraGuide:FlxSprite;
	
	
	
	//var aPlatform:TestPlatform;
	override public function create():Void
	{
		super.create();
		zent = new Player();
		theSky = new Sky();
		theNight = new Night();
		
		//testBadGuy = new BadGuy();
		//add(testBadGuy);
		
		Reg.badGuys = new FlxTypedGroup<BadGuy>();
		loader = new FlxOgmoLoader(AssetPaths.Level__oel);
		tilemap = loader.loadTilemap(AssetPaths.beastlands__png, 16, 16, "Tiles");
		
		tilemap.setTileProperties(0, FlxObject.NONE);
		tilemap.setTileProperties(92, FlxObject.ANY);
		tilemap.setTileProperties(150, FlxObject.ANY);
		
		loader.loadEntities(entityCreator, "Entities");
		
		FlxG.camera.setScrollBounds(0, tilemap.width, 0, tilemap.height);
		FlxG.worldBounds.set(0, 0, tilemap.width, tilemap.height);
		cameraGuide = new FlxSprite(FlxG.width / 2, FlxG.height / 2);
		cameraGuide.makeGraphic(1, 1, 0x00000000);
		cameraGuide.velocity.x = 50;
		FlxG.camera.follow(cameraGuide);
		
		
		Daystart();
		
		add(cameraGuide);
		add(theSky);
		add(zent);
		add(Reg.badGuys);
		add(tilemap);
		add(theNight);
		
		//aPlatform = new TestPlatform();
		//add(aPlatform);
		//aPlatform.immovable = true;
	}
	private function Daystart()
	{
		theSky.morning();
		dayTime.start(20, theSky.evening, 1);
		incommingDarkness.start(30, theNight.appear, 1); //La diferencia de tiempo entre dayTime e Incoming darkness vendria a ser el atardecer.
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
		FlxG.collide(zent, tilemap);
		for(i in 0... Reg.badGuys.members.length)
			FlxG.collide(Reg.badGuys.members[i], tilemap);
		if (theNight.visible == true)
			Daystart();
	}
}
