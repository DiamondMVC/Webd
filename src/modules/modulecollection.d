module webd.modules.modulecollection;

import webd.modules.modulepackage;

private static __gshared ModulePackage[string] _modules;

void addModule(string name, ModulePackage modulePackage)
{
  _modules[name] = modulePackage;
}

void fireEvent(T)(string moduleName, string event, T args)
{
  auto modulePackage = _modules.get(moduleName, null);

  if (!modulePackage)
  {
    return;
  }

  modulePackage.fireEvent!T(event, args);
}
