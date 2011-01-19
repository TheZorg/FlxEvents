package org.thezorg.actions
{
	import org.flixel.*;
	
	/**
	 * <code>ActionList</code>s execute all Actions at once. It can contain any object
	 * implementing <code>IActionEvent</code>, including other <code>ActionList</code>s,
	 * as well as <code>ActionCommand</code>s.
	 * @author Fab
	 * 
	 */
	public class ActionList extends FlxGroup implements IActionEvent, IActionListener
	{
		private var _listener:IActionListener;
		
		public function ActionList(Listener:IActionListener = null)
		{
			super();
			listener = Listener;
		}
		
		/**
		 * Add an Action to the List. 
		 * @param Object	The Action to add
		 * @param ListenToCallback	Whether or not the list should <code>callback()</code> when this action finishes
		 * @return 
		 * 
		 */
		public function addAction(Object:FlxObject, ListenToCallback:Boolean=false):FlxObject
		{
			if(Object is IActionEvent && ListenToCallback)
				(Object as IActionEvent).listener = this;
			return add(Object)
		}
		
		override public function update():void
		{
			var i:uint = 0;
			var o:FlxObject;
			var ml:uint = members.length;
			while(i < ml)
			{
				o = members[i++] as FlxObject;
				if((o != null) && o.active)
				{
					if(o is ActionCommand)
					{
						(o as ActionCommand).execute();
						o.kill();
					}
					else if(o is IActionEvent)
						o.update();
				}
			}
		}
		
		/**
		 * Resets and activates the list. 
		 * 
		 */
		override public function reset():void
		{
			super.reset(0,0);
			var i:uint = 0;
			var o:FlxObject;
			var ml:uint = members.length;
			while(i < ml)
			{
				o = members[i++] as FlxObject;
				if((o != null) && o.exists)
				{
					o.reset();
				}
			}
			active = true;
		}
		
		public function callback(event:IActionEvent):void
		{
			if(listener != null) listener.callback(this);
		}

		public function get listener():IActionListener
		{
			return _listener;
		}

		public function set listener(value:IActionListener):void
		{
			_listener = value;
		}
		
		public function activate():void
		{
			active = true;
		}
		
		public function deactivate():void
		{
			active = false;
		}

	}
}