package;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.util.FlxColor;
import flixel.FlxObject;
import flixel.FlxCamera;

class Spikes extends FlxSprite
{
	//public var danger:Bool = true;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(50, 15, FlxColor.WHITE);
		acceleration.y = 600;
	}
	/*public function dangerOff()
	{
		danger = false;
	}*/
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
	
	
}