module webd.models.database.webitem;

import diamond.database;

final class WebdWebItem : MySql.MySqlModel!"webd_web_items"
{
  public:
  @DbId ulong id;
  ulong parentItem;
  string name;
  string cssClasses;
  string templateView;
  bool disabled;
  bool deleted;
  ulong updateUser;
  @DbTimestamp DateTime timestamp;

  this() { super(); }
}
