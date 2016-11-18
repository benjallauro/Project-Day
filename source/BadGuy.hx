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
		makeGraphic(50, 80, FlxColor.RED);
		acceleration.y = 600;
	}
	public function death()
	{
		kill();
	}
	private function startMoving()
	{
		velocity.x = -50;
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (isOnScreen() == true)
			velocity.x = -50;
	}
}