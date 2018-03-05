module webd.models.database.modulepackage;

import diamond.database;

final class WebdModule : MySql.MySqlModel!"webd_modules"
{
  public:
  @DbId ulong id;
  string name;
  string cssClasses;
  bool disabled;
  bool deleted;
  ulong updateUser;
  @DbTimestamp DateTime timestamp;

  this() { super(); }
}
