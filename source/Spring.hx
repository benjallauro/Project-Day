package;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.system.FlxSound;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.util.FlxColor;
import flixel.FlxObject;
import flixel.FlxCamera;

class Spring extends FlxSprite
{
	var springSound:FlxSound;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		//makeGraphic(50, 15, FlxColor.YELLOW);
		loadGraphic(AssetPaths.Spring__png, true, 50, 30);
		animation.add("before", [0, 0], 1, false);
		animation.play("before");
		animation.add("after", [1, 1], 1, true);
		springSound = new FlxSound();
		springSound.loadEmbedded(AssetPaths.springSound__wav);
	}
	public function changeSprite()
	{
		animation.play("after");
		springSound.play();
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
	
}