package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.util.FlxColor;
import flixel.FlxObject;
import flixel.util.FlxTimer;
import flixel.system.FlxSound;



class Player extends FlxSprite
{
	var life:Int = 3;
	var direction:Bool; //Si es true, mira a la izquierda.
	var invencible:Bool = false;
	var escapeTime:FlxTimer = new FlxTimer();
	private var jumpSound:FlxSound;
	private var hurtSound:FlxSound;
	private var walkSound:FlxSound;
	private var blackTime:FlxTimer = new FlxTimer();
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
		jumpSound = new FlxSound();
		jumpSound.loadEmbedded(AssetPaths.jumpSound__wav);
		hurtSound = new FlxSound();
		hurtSound.loadEmbedded(AssetPaths.hurtSound__wav);
		walkSound = new FlxSound();
		walkSound.loadEmbedded(AssetPaths.theBugs2__wav);
		walkSound.volume = 1;
		//FlxColor.BLACK;
	}
	public function damage()
	{
		if (invencible == false)
		{
		life--;
		if (life <= 0)
			death();
			invencible = true;
			hurtSound.play();
			escapeTime.start(0.5, dangerAgain, 1);
		}
	}
	public function fell()
	{
		death();
	}
	private function dangerAgain(Timer:FlxTimer)
	{
		invencible = false;
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
		velocity.y = -350;
	}
	public function black()
	{
		FlxColor.BLACK;
		blackTime.start();
	}
	private function colorful()
	{
		FlxColor.fromRGB;
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
			jumpSound.play();
		}
		Reg.zentX = x;
		//Condiciones de animaciones y sonidos:
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
			//walkSound.play();
		}
		if (isTouching(FlxObject.FLOOR) && FlxG.keys.pressed.LEFT && FlxG.keys.pressed.RIGHT == false)
		{
			animation.play("walk");
		}
		if (velocity.x != 0 && isTouching(FlxObject.FLOOR) && walkSound.playing == false)
			walkSound.play();
		if (walkSound.playing == true && velocity.x == 0)
			walkSound.stop();
		if (walkSound.playing == true && isTouching(FlxObject.FLOOR) == false)
			walkSound.stop();
		if (direction == true)
			flipX = true;
		else
			flipX = false;
		super.update(elapsed);
	}
	
}