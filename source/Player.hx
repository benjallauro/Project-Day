package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.util.FlxColor;
import flixel.FlxObject;
import flixel.util.FlxTimer;



class Player extends FlxSprite
{
	var life:Int = 3;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(50, 80, FlxColor.YELLOW);
		x = 50;
		y = 50;
		acceleration.y = 600;
	}
	public function damage()
	{
		life--;
		if (life <= 0)
			death();
	}
	public function flinchLeft()
	{
		x -= 100;
	}
	public function flinchRight()
	{
		x += 100;
	}
	private function death()
	{
		kill();
	}
	public function jump2()
	{
		velocity.y = -200;
	}
	override public function update(elapsed:Float):Void
	{
		velocity.x = 0;
		if (FlxG.keys.pressed.RIGHT && FlxG.keys.pressed.LEFT == false)
		{
			velocity.x = 200;
		}
		if (FlxG.keys.pressed.LEFT && FlxG.keys.pressed.RIGHT == false)
		{
			velocity.x = -200;
		}
		if (FlxG.keys.justPressed.C && isTouching(FlxObject.FLOOR))
		{
			velocity.y = -400;
		}
		super.update(elapsed);
	}
	
}