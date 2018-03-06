/**
* Copyright © Webd 2018
* License: MIT (https://github.com/DiamondMVC/Webd/blob/master/LICENSE)
* Author: Jacob Jensen (bausshf)
*/
module webd.models.database.webitem;

import diamond.database;

/// Db representation of an item.
final class WebdWebItem : MySql.MySqlModel!"webd_web_items"
{
  public:
  /// The id.
  @DbId ulong id;
  /// The parent item id.
  ulong parentItem;
  /// The name.
  string name;
  /// The css classes.
  string cssClasses;
  /// The template view.
  string templateView;
  /// Boolean determining whether the item is disabled or not.
  bool disabled;
  /// Boolean determining whether the item is deleted or not.
  bool deleted;
  /// The user who last updated the item.
  ulong updateUser;
  /// The time the item was last updated.
  @DbTimestamp DateTime timestamp;

  this() { super(); }
}
