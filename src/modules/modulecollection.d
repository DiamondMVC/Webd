/**
* Copyright © Webd 2018
* License: MIT (https://github.com/DiamondMVC/Webd/blob/master/LICENSE)
* Author: Jacob Jensen (bausshf)
*/
module webd.modules.modulecollection;

import webd.modules.modulepackage;

/// Collection of modules.
private static __gshared ModulePackage[string] _modules;

/**
* Adds a new module to the module collection.
* Params:
*   name =          The name of the module.
*   modulePackage = The module to add.
*/
void addModule(string name, ModulePackage modulePackage)
{
  _modules[name] = modulePackage;
}

/**
* Fires an event for a module.
* Params:
*   moduleName = The name of the module.
*   event =      The event to fire.
*   args =       The arguments to pass to the event handler.
*/
void fireEvent(T)(string moduleName, string event, T args)
{
  auto modulePackage = _modules.get(moduleName, null);

  if (!modulePackage)
  {
    return;
  }

  modulePackage.fireEvent!T(event, args);
}
