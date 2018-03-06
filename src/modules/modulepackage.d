/**
* Copyright © Webd 2018
* License: MIT (https://github.com/DiamondMVC/Webd/blob/master/LICENSE)
* Author: Jacob Jensen (bausshf)
*/
module webd.modules.modulepackage;

import webd.modules.moduleaction;

/// Wrapper for a module.
abstract class ModulePackage
{
  private:
  /// Collection of module action events.
  IModuleAction[string] _actions;
  /// Boolean determining whether the module is disabled or not.
  bool _disabled;

  protected:
  this() { }

  public:
  @property
  {
    /// Gets a boolean determining whether the module is disabled or not.
    bool disabled() { return _disabled; }

    /// Sets a boolean determining whether the module is disabled or not.
    void disabled(bool disabledState)
    {
      _disabled = disabledState;
    }
  }

  /**
  * Subscribes to an event.
  * Params:
  *   event = The event to subscribe to.
  *   action = The event handler.
  */
  void subscribeEvent(string event, IModuleAction action)
  {
    _actions[event] = action;
  }

  /**
  * Unsubscribes from an event.
  * Params:
  *   event = The event to unsubscribe from.
  */
  void unsubscribeEvent(string event)
  {
    if (_actions && event in _actions)
    {
      _actions.remove(event);
    }
  }

  /**
  * Fires an event for the module.
  * Params:
  *   event = The event to fire.
  *   args =  The arguments to pass to the event handler.
  */
  void fireEvent(T)(string event, T args)
  {
    if (_disabled)
    {
      return;
    }

    auto action = cast(ModuleAction!T)_actions.get(event, null);

    if (action)
    {
      action(args);
    }
  }
}
