/**
* Copyright © Webd 2018
* License: MIT (https://github.com/DiamondMVC/Webd/blob/master/LICENSE)
* Author: Jacob Jensen (bausshf)
*/
module webd.models.database.webitemlist;

import diamond.database;

/// Db representation of an item list.
final class WebdWebItemList : MySql.MySqlModel!"webd_web_itemlists"
{
  public:
  /// The id.
  @DbId ulong id;
  /// The id of the page to retrieve items from.
  ulong pageId;
  /// Boolean determining whether it should include sub pages.
  bool includeSubPages;
  /// The name.
  string name;
  /// The css classes for the list.
  string cssClasses;
  /// The css classes for the items.
  string cssClassesItem;
  /// The template view for the items.
  string templateView;
  /// Boolean determining whether the item list has been deleted or not.
  bool deleted;
  /// The user who last updated the item list.
  ulong updateUser;
  /// The time the item list was last updated.
  @DbTimestamp DateTime timestamp;

  this() { super(); }
}
