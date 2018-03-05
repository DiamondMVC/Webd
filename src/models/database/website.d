module webd.models.database.website;

import diamond.database;

final class WebdWebsite : MySql.MySqlModel!"webd_websites"
{
  public:
  @DbId ulong id;
  string name;
  string language;
  ulong updateUser;
  @DbTimestamp DateTime timestamp;

  this() { super(); }
}
