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
class Cloud extends FlxSprite
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.cloud__png, true, 39, 16);
		scale.x = 2;
		scale.y = 2;
		scrollFactor.set(0.2, 0);
		animation.add("day", [0, 0], 1, true);
		animation.play("day");
		
	}
		override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
	}
}
