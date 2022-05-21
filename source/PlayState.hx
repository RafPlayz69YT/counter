package;

import flixel.FlxState;
import flixel.text.FlxText;
import flixel.FlxG;

class PlayState extends FlxState
{
	var counter:cpp.UInt64 = 0;
	var counterText:FlxText;

	override public function create()
	{
		var counterText = new FlxText(0, 0, 0, "10000", 64);
		counterText.screenCenter();
		add(counterText);
		counterText.text = "0";
		super.create();
	}

	function refreshText()
	{
		counterText.text = Std.string(counter);
		counterText.screenCenter();
	}

	function increase()
	{
		counter++;
		FlxG.camera.flash(0xbbffffff, 0.1);
		refreshText();
	}

	override public function update(elapsed:Float)
	{
		#if mobile
		for (touch in FlxG.touches.list)
		{
			if (touch.justPressed)
				increase();
		}
		#else
		if (FlxG.mouse.justPressed || FlxG.keys.justPressed.ANY)
			increase();
		#end
		super.update(elapsed);
	}
}
