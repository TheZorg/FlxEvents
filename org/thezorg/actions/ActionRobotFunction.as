package com.HL.actions
{
	import org.flixel.*;
	
	public class ActionRobotFunction extends FlxObject implements IActionEvent
	{
		private var _listener:IActionListener;
		
		protected var reference:Object;
		protected var variable:String;
		protected var startValue:Number;
		public var endValue:Number;
		protected var duration:Number;
		protected var currTime:Number;
		
		public function ActionRobotFunction(Reference:Object, Variable:String, EndValue:Number, Duration:Number, Listener:IActionListener = null)
		{
			super();
			variable = Variable;
			if (!Reference.hasOwnProperty(variable))
			{
				FlxG.log("ERROR: The reference does not have variable '" + variable + "'");
				return;
			}
			reference = Reference;
			endValue = EndValue;
			duration = Duration;
			listener = Listener;
			startValue = reference[variable];
			currTime = 0;
		}
		
		override public function update():void
		{
			currTime += FlxG.elapsed;
			if (currTime >= duration)
			{
				reference[variable] = endValue;
				if (listener != null) listener.callback(this);
				deactivate();
			}
			else updateFunction();
		}
		
		public function updateFunction():void
		{
			
		}
		
		override public function reset(X:Number=0, Y:Number=0):void
		{
			super.reset();
			startValue = reference[variable];
			currTime = 0;
			active = true;
		}
		
		public function activate():void
		{
			active = true;
		}
		
		public function deactivate():void
		{
			active = false;
		}

		public function get listener():IActionListener
		{
			return _listener;
		}

		public function set listener(value:IActionListener):void
		{
			_listener = value;
		}

	}
}