package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.FlxGame;
import openfl.Lib;
import openfl.display.Sprite;

class InstructionState extends FlxState
{
	private var instructions:FlxText;
	private var instructions2:FlxText;
	private var instructions3:FlxText;
	private var instructions4:FlxText;
	private var instructions5:FlxText;
	private var instructions6:FlxText;
	private var instructions7:FlxText;
	private var toStart:FlxText;
	private var recomendacion:FlxText;
	override public function create():Void
	{
		var firstSound:FlxSound;
		super.create();
		firstSound = new FlxSound();
		firstSound.loadEmbedded(AssetPaths.Powerup14__wav);
		firstSound.play();
		instructions = new FlxText(550, 150);
		instructions.color = 0xedcd50;
		instructions.text = "Lleva a Zent hasta el fin del recorrido.";
		instructions.scale.x = 4;
		instructions.scale.y = 4;
		instructions.setBorderStyle(FlxTextBorderStyle.SHADOW, 0xFF1abcc9);
		add(instructions);
		
		instructions2 = new FlxText(530, 190);
		instructions2.color = 0xedcd50;
		instructions2.text = "Salta sobre los enemigos para destruirlos y encima de";
		instructions2.scale.x = 4;
		instructions2.scale.y = 4;
		instructions2.setBorderStyle(FlxTextBorderStyle.SHADOW, 0xFF1abcc9);
		add(instructions2);
		
		instructions3 = new FlxText(530, 230);
		instructions3.color = 0xedcd50;
		instructions3.text = "las plataformas con flechas para impulsarte hacia arriba.";
		instructions3.scale.x = 4;
		instructions3.scale.y = 4;
		instructions3.setBorderStyle(FlxTextBorderStyle.SHADOW, 0xFF1abcc9);
		add(instructions3);
		
		instructions4 = new FlxText(530, 270);
		instructions4.color = 0xedcd50;
		instructions4.text = "Pero eso no es todo. ¡Cuidado con la noche!";
		instructions4.scale.x = 4;
		instructions4.scale.y = 4;
		instructions4.setBorderStyle(FlxTextBorderStyle.SHADOW, 0xFF1abcc9);
		add(instructions4);
		
		instructions5 = new FlxText(490, 310);
		instructions5.color = 0xedcd50;
		instructions5.text = "No podrás ver nada en ese momento. Usa los sonidos y el color";
		instructions5.scale.x = 4;
		instructions5.scale.y = 4;
		instructions5.setBorderStyle(FlxTextBorderStyle.SHADOW, 0xFF1abcc9);
		add(instructions5);
		
		instructions6 = new FlxText(490, 350);
		instructions6.color = 0xedcd50;
		instructions6.text = "del cielo para predecir la llegada de la oscuridad.";
		instructions6.scale.x = 4;
		instructions6.scale.y = 4;
		instructions6.setBorderStyle(FlxTextBorderStyle.SHADOW, 0xFF1abcc9);
		add(instructions6);
		
		instructions7 = new FlxText(570, 410);
		instructions7.color = 0xedcd50;
		instructions7.text = "¡Buena suerte!";
		instructions7.scale.x = 4;
		instructions7.scale.y = 4;
		instructions7.setBorderStyle(FlxTextBorderStyle.SHADOW, 0xFF1abcc9);
		add(instructions7);
		
		toStart = new FlxText(570, 600);
		toStart.color = 0xedcd50;
		toStart.text = "Pulsa ENTER para comenzar.";
		toStart.scale.x = 4;
		toStart.scale.y = 4;
		toStart.setBorderStyle(FlxTextBorderStyle.SHADOW, 0xFF1abcc9);
		add(toStart);

		recomendacion = new FlxText(550, 700);
		recomendacion.color = 0xedcd50;
		recomendacion.text = "Se recomienda jugar con auriculares.";
		recomendacion.scale.x = 4;
		recomendacion.scale.y = 4;
		recomendacion.setBorderStyle(FlxTextBorderStyle.NONE, 0xFF1abcc9);
		add(recomendacion);
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (FlxG.keys.justPressed.ENTER)
			FlxG.switchState(new PlayState());
		
	}
	
}