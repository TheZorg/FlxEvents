package org.thezorg.actions
{
	import org.flixel.*;
	
	public class ActionList extends FlxGroup implements IActionEvent, IActionListener
	{
		private var _listener:IActionListener;
		
		public function ActionList(Listener:IActionListener = null)
		{
			super();
			listener = Listener;
		}
		
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
		
		override public function reset(X:Number = 0, Y:Number = 0):void
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