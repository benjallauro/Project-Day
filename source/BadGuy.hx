package;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.util.FlxColor;
import flixel.FlxObject;
import flixel.FlxCamera;

class BadGuy extends FlxSprite
{
	
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.theBadGuy__png, true, 50, 80);
		animation.add("move", [0, 1], 8, true);
		acceleration.y = 600;
	}
	public function death()
	{
		kill();
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