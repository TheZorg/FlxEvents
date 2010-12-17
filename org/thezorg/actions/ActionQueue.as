package com.HL.actions
{	
	import org.flixel.FlxGroup;
	import org.flixel.FlxObject;
	
	public class ActionQueue extends FlxGroup implements IActionListener, IActionEvent
	{
		private var _listener:IActionListener;
		
		public function ActionQueue(Listener:IActionListener = null)
		{
			super();
			listener = Listener;
		}
		
		public function enqueue(Object:FlxObject):ActionQueue
		{
			if(Object is IActionEvent)
				(Object as IActionEvent).listener = this;
			//return add(Object);
			add(Object);
			return this;
		}
		
		public function getFirstActive():FlxObject
		{
			var i:uint = 0;
			var o:FlxObject;
			var ml:uint = members.length;
			while(i < ml)
			{
				o = members[i++] as FlxObject;
				if((o != null) && o.active)
					return o;
			}
			return null;
		}
		
		override public function update():void
		{
			var o:FlxObject = getFirstActive();
			if(o == null)
			{
				active = false;
				if (listener != null) listener.callback(this);
				return;
			}
			while(o is ActionCommand)
			{
				(o as ActionCommand).execute();
				o.kill();
				o = getFirstActive();
				if(o == null) return;
			}
			if(o is IActionEvent)
			{
				o.update();
			}
		}
		
		public function callback(event:IActionEvent):void
		{
			event.kill();
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