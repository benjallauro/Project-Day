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

class Chaser extends FlxSprite
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(2, 720, FlxColor.TRANSPARENT);
		x = -50;
		y = 0;
		velocity.x = 50;
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
	
}