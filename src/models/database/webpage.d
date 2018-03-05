module webd.models.database.webpage;

import diamond.database;

final class WebdWebPage : MySql.MySqlModel!"webd_web_pages"
{
  public:
  @DbId ulong id;
  ulong website;
  @DbNull ulong parentPage;
  ulong sortOrder;
  string name;
  @DbNull string route;
  string cssClasses;
  bool navigationHide;
  @DbNull string redirectTo;
  string title;
  @DbNull string keywords;
  @DbNull string description;
  bool searchable;
  bool published;
  bool deleted;
  ulong updateUser;
  ulong itemId;
  ulong itemListId;
  ulong moduleId;
  @DbTimestamp DateTime timestamp;

  this() { super(); }
}
