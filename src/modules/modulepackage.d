module webd.modules.modulepackage;

import webd.modules.moduleaction;

abstract class ModulePackage
{
  private:
  IModuleAction[string] _actions;
  bool _disabled;

  protected:
  this() { }

  public:
  @property
  {
    bool disabled() { return _disabled; }

    void disabled(bool disabledState)
    {
      _disabled = disabledState;
    }
  }

  void subscribeEvent(string event, IModuleAction action)
  {
    _actions[event] = action;
  }

  void unsubscribeEvent(string event)
  {
    if (_actions && event in _actions)
    {
      _actions.remove(event);
    }
  }

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
