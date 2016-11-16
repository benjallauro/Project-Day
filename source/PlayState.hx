package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

class PlayState extends FlxState
{
	var zent:Player;
	var testBadGuy:BadGuy;
	
	var aPlatform:TestPlatform;
	override public function create():Void
	{
		super.create();
		zent = new Player();
		add(zent);
		
		
		testBadGuy = new BadGuy();
		add(testBadGuy);
		aPlatform = new TestPlatform();
		add(aPlatform);
		aPlatform.immovable = true;
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		FlxG.collide(zent, aPlatform);
		FlxG.collide(testBadGuy, aPlatform);
		
	}
}
