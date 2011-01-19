package org.thezorg.actions
{
	import org.flixel.FlxObject;
	
	/**
	 * Behaviors have complete control over any object, and
	 * the condition for their completion is completely arbitrary. 
	 * @author Fab
	 * 
	 */
	public class ActionBehavior extends FlxObject implements IActionEvent
	{
		private var _listener:IActionListener;
		
		public function ActionBehavior()
		{
			super();
		}
		
		/**
		 * Call this when the behavior finishes. By default calls the listener's
		 * <code>callback()</code> then deactivates itself. 
		 * 
		 */
		public function behaviorDone():void
		{
			if (listener != null) listener.callback(this);
			deactivate();
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