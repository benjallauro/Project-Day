package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import flixel.system.FlxSound;

class Sky extends FlxSprite
{
	var wolfSound:FlxSound;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		scrollFactor.set(0, 0); // No es afectado por la camara
		wolfSound = new FlxSound();
		wolfSound.loadEmbedded(AssetPaths.wolf__wav);
	}
	public function morning()
	{
		makeGraphic(1280, 720, FlxColor.CYAN);
	}
	public function evening(Timer:FlxTimer)
	{
		makeGraphic(1280, 720, FlxColor.ORANGE);
		wolfSound.play();
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}