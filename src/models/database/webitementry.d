/**
* Copyright © Webd 2018
* License: MIT (https://github.com/DiamondMVC/Webd/blob/master/LICENSE)
* Author: Jacob Jensen (bausshf)
*/
module webd.models.database.webitementry;

import diamond.database;

/// Db representation of an item entry.
final class WebdWebItemEntry : MySql.MySqlModel!"webd_web_itementries"
{
  public:
  /// The id.
  @DbId ulong id;
  /// The item id.
  ulong itemId;
  /// The parent item entry id.
  @DbNull ulong parentValue;
  /// The name.
  string name;
  /// The text value.
  string textValue;
  /// The numeric value.
  long numericValue;
  /// The decimal value.
  double decimalValue;
  /// The datetime value.
  DateTime datetimeValue;
  /// The boolean value.
  bool booleanValue;
  /// The type.
  string type;
  /// Boolean determining whether the item entry was deleted or not.
  bool deleted;
  /// The user who last updated the item entry.
  ulong updateUser;
  /// The time the item entry was last updated.
  @DbTimestamp DateTime timestamp;

  this() { super(); }
}
