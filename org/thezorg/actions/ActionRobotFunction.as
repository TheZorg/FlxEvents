package org.thezorg.actions
{
	import org.flixel.*;
	
	/**
	 * Robot functions manipulate and transform an object's variable according
	 * to a certain function over a certain period of time. 
	 * @author Fab
	 * 
	 */
	public class ActionRobotFunction extends FlxObject implements IActionEvent
	{
		private var _listener:IActionListener;
		
		protected var reference:Object;
		protected var variable:String;
		protected var startValue:Number;
		public var endValue:Number;
		protected var duration:Number;
		protected var currTime:Number;
		
		/**
		 * Instantiates the basic variables necessary for robot functions
		 * @param Reference	The object whose variable will be manipulated
		 * @param Variable	The name of the variable to manipulate
		 * @param EndValue	The value of the variable at the end of the function
		 * @param Duration	The time period for which the variable will be manipulated
		 * @param Listener	An <code>IActionListener</code> listening to the end of the function
		 * 
		 */
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
		
		/**
		 * Performs default update functions common to all robot functions. <strong> Do
		 * not override this function</strong>, override <code>updateFunction()</code> instead. 
		 * 
		 */
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
		
		/**
		 * This is where the function does its custom updating. 
		 * 
		 */
		public function updateFunction():void
		{
			
		}
		
		/**
		 * Resets and activates the function. The starting value will be replaced
		 * by the current value of the reference variable.
		 * 
		 */
		override public function reset():void
		{
			super.reset(0,0);
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