package org.thezorg.actions
{
	/**
	 * Defines the <code>callback()</code> function, implemented by 
	 * any object wishing to listen to an <code>ActionEvent</code>. 
	 * @author Fab
	 * 
	 */
	public interface IActionListener
	{
		function callback(event:IActionEvent):void;
	}
}