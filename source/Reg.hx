package;
import flixel.FlxG;
import flixel.FlxCamera.FlxCameraFollowStyle;
import flixel.addons.editors.tiled.TiledObjectLayer;
import flixel.FlxObject;
import flixel.math.FlxRandom;
import flixel.util.FlxColor;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.group.FlxGroup;
import flixel.math.FlxMath;
import flixel.addons.editors.ogmo.FlxOgmoLoader;//para cargar el nivel de ogmo
import flixel.tile.FlxTilemap;//para usarlo
import flixel.FlxObject;

class Reg
{
	static public var badGuys:FlxTypedGroup<BadGuy>;
	static public var spikesGroup:FlxTypedGroup<Spikes>;
	static public var springs:FlxTypedGroup<Spring>;
	static public var clouds:FlxTypedGroup<Cloud>;
	static public var zentX:Float;
	
}