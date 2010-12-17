package com.HL.actions
{
	
	public interface IActionEvent
	{
		function update():void;
		function kill():void;
		function get listener():IActionListener;
		function set listener(value:IActionListener):void;
		function activate():void;
		function deactivate():void;
	}
}