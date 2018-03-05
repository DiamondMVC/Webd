module webd.models.database.webitementry;

import diamond.database;

final class WebdWebItemEntry : MySql.MySqlModel!"webd_web_itementries"
{
  public:
  @DbId ulong id;
  ulong itemId;
  @DbNull ulong parentValue;
  string name;
  string textValue;
  long numericValue;
  double decimalValue;
  DateTime datetimeValue;
  bool booleanValue;
  string type;
  bool deleted;
  ulong updateUser;
  @DbTimestamp DateTime timestamp;

  this() { super(); }
}
