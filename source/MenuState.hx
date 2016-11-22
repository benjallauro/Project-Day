package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.FlxGame;
import openfl.Lib;
import openfl.display.Sprite;

class MenuState extends FlxState
{
	private var titulo:FlxText;
	private var titulos:FlxText;
	private var opciones:FlxText;
	override public function create():Void
	{
		super.create();
		titulo = new FlxText(600, 300);
		titulo.color = 0xedcd50;
		titulo.text = "Dodge the Night";
		titulo.scale.x = 10;
		titulo.scale.y = 10;
		titulo.setBorderStyle(FlxTextBorderStyle.SHADOW, 0xFF1abcc9);
		add(titulo);
		
		titulos = new FlxText(600, 400);
		titulos.color = 0xedcd50;
		titulos.text = "Por Benjamín Llauró";
		titulos.scale.x = 5;
		titulos.scale.y = 5;
		titulos.setBorderStyle(FlxTextBorderStyle.SHADOW, 0xFF1abcc9);
		add(titulos);
		
		opciones = new FlxText(600, 600);
		opciones.color = 0xedcd50;
		opciones.text = "Pulsa ENTER";
		opciones.scale.x = 4;
		opciones.scale.y = 4;
		opciones.setBorderStyle(FlxTextBorderStyle.SHADOW, 0xFF1abcc9);
		add(opciones);
		
		
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (FlxG.keys.justPressed.ENTER)
			FlxG.switchState(new InstructionState());
	}
}
