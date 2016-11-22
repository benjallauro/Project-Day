package;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.util.FlxColor;
import flixel.FlxObject;
import flixel.FlxCamera;
import flixel.system.FlxSound;

class BadGuy extends FlxSprite
{
	var deathSound:FlxSound;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.theBadGuy__png, true, 50, 80);
		animation.add("move", [0, 1], 8, true);
		acceleration.y = 600;
		deathSound = new FlxSound();
		deathSound.loadEmbedded(AssetPaths.enemyDeath__wav);
	}
	public function death()
	{
		kill();
		deathSound.play();
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (isOnScreen() == true && x < Reg.zentX + 700)
		{
			velocity.x = -50;
			animation.play("move");
		}
	}
}