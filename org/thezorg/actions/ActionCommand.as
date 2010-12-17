package com.HL.actions
{
	import org.flixel.FlxObject;
	
	public class ActionCommand extends FlxObject
	{
		public function ActionCommand()
		{
			super();
			visible = false;
		}
		
		public function execute():void
		{
		}
		
		override public function kill():void
		{
			super.kill();
			active = false;
		}
		
		override public function reset(X:Number=0, Y:Number=0):void
		{
			super.reset();
			active = true;
		}
	}
}