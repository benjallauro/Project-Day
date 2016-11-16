package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

class Sky extends FlxSprite
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(1280, 720, FlxColor.CYAN);
		scrollFactor.set(0, 0); // No es afectado por la camara
		var dayTime:FlxTimer = new FlxTimer();
		dayTime.start(10, evening, 1);
		
	}
	public function morning()
	{
		FlxColor.CYAN;
	}
	public function evening(Timer:FlxTimer)
	{
		makeGraphic(1280, 720, FlxColor.ORANGE);
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}