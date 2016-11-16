package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;
import flixel.FlxG;


class TestPlatform extends FlxSprite
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(3000, 100, FlxColor.BLUE);
		x = 0;
		y = 600;
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
	
}