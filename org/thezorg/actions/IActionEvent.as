package org.thezorg.actions
{
	
	/**
	 * Defines functions common to <code>ActionBehavior</code>,
	 * <code>ActionList</code>, <code>ActionQueue</code> and
	 * <code>ActionRobotFunction</code>.
	 * @author Fab
	 * 
	 */
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