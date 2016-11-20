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
	var direction:Bool; //Si es true, mira a la izquierda.
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.Badabam__png, true, 50, 69);
		animation.add("idle", [0, 1], 5, true);
		animation.add("jump", [2, 2], 5, true);
		animation.add("walk", [3, 4], 8, true);

		x = 200;
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
	public function flinchUp()
	{
		velocity.y = -150;
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
			direction = false;
		}
		if (FlxG.keys.pressed.LEFT && FlxG.keys.pressed.RIGHT == false)
		{
			velocity.x = -200;
			direction = true;
		}
		if (FlxG.keys.justPressed.C && isTouching(FlxObject.FLOOR))
		{
			velocity.y = -400;
		}
		Reg.zentX = x;
		//Condiciones de animaciones:
		if (FlxG.keys.pressed.RIGHT == false && FlxG.keys.pressed.LEFT == false && isTouching(FlxObject.FLOOR))
		{
			animation.play("idle");
		}
		if (isTouching(FlxObject.FLOOR) == false)
		{
			animation.play("jump");
		}
		if (isTouching(FlxObject.FLOOR) && FlxG.keys.pressed.RIGHT && FlxG.keys.pressed.LEFT == false)
		{
			animation.play("walk");
		}
		if (isTouching(FlxObject.FLOOR) && FlxG.keys.pressed.LEFT && FlxG.keys.pressed.RIGHT == false)
		{
			animation.play("walk");
		}
		if (direction == true)
			flipX = true;
		else
			flipX = false;
		super.update(elapsed);
	}
	
}