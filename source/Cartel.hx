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

class Cartel extends FlxSprite
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.Cartel__png, true, 80, 80);
		x = 8900;
		y = 15;
		acceleration.y = 100;
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}