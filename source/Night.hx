package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

class Night extends FlxSprite
{
	var darknessHere:FlxTimer = new FlxTimer();
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(1280, 720, FlxColor.BLACK);
		visible = false;
		scrollFactor.set(0, 0);
	}
	public function appear(Timer:FlxTimer)
	{
		visible = true;
		darknessHere.start(5, leave, 1);
	}
	private function leave(Timer:FlxTimer)
	{
		visible = false;
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
	
}