package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.system.FlxSound;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

class Night extends FlxSprite
{
	var darknessHere:FlxTimer = new FlxTimer();
	var nightSound:FlxSound;
	public function new(?X:Float = 0, ?Y:Float = 0, ?SimpleGraphic:FlxGraphicAsset)
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(1280, 720, FlxColor.BLACK);
		visible = false;
		scrollFactor.set(0, 0);
		nightSound = new FlxSound();
		nightSound.loadEmbedded(AssetPaths.nightSoundFinal__wav);
	}
	public function appear(Timer:FlxTimer)
	{
		visible = true;
		darknessHere.start(2.5, leave, 1);
		nightSound.play();
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