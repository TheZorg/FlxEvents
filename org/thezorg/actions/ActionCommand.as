package org.thezorg.actions
{
	import org.flixel.FlxObject;
	
	/**
	 * Commands are a wrapper for simple one-time function calls. They
	 * are executed all at once when encountered by <code>ActionQueue</code>s.
	 * @author Fab
	 * 
	 */
	public class ActionCommand extends FlxObject
	{
		private var func:Function;
		
		public function ActionCommand(SimpleFunction:Function = null)
		{
			super();
			visible = false;
			func = SimpleFunction;
		}
		
		public function execute():void
		{
			if (func != null) func();
		}
		
		override public function kill():void
		{
			super.kill();
			active = false;
		}
		
		public function set simpleFunction(SimpleFunction:Function):void
		{
			func = SimpleFunction;
		}
		
		override public function reset(X:Number=0, Y:Number=0):void
		{
			super.reset();
			active = true;
		}
	}
}