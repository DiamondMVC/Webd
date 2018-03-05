module webd.models.database.webitemlist;

import diamond.database;

final class WebdWebItemList : MySql.MySqlModel!"webd_web_itemlists"
{
  public:
  @DbId ulong id;
  ulong pageId;
  bool includeSubPages;
  string name;
  string cssClasses;
  string cssClassesItem;
  string templateView;
  bool deleted;
  ulong updateUser;
  @DbTimestamp DateTime timestamp;

  this() { super(); }
}
