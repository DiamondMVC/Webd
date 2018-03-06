/**
* Copyright © Webd 2018
* License: MIT (https://github.com/DiamondMVC/Webd/blob/master/LICENSE)
* Author: Jacob Jensen (bausshf)
*/
module webd.models.database.webpage;

import diamond.database;

/// Db representation of a page.
final class WebdWebPage : MySql.MySqlModel!"webd_web_pages"
{
  public:
  /// The id of the page.
  @DbId ulong id;
  /// The website.
  ulong website;
  /// The parent page.
  @DbNull ulong parentPage;
  /// The sort order.
  ulong sortOrder;
  /// The name.
  string name;
  /// The route.
  @DbNull string route;
  /// The css classes.
  string cssClasses;
  /// Boolean determining whether it should be hidden in navigation.
  bool navigationHide;
  /// An url to redirect to when this page is met.
  @DbNull string redirectTo;
  /// The title of the page.
  string title;
  /// The keywords.
  @DbNull string keywords;
  /// The description of the page.
  @DbNull string description;
  /// Boolean determining whether the page is searchable by search engines.
  bool searchable;
  /// Boolean determining whether the page is published or not.
  bool published;
  /// Boolean determining whether the page has been deleted or not.
  bool deleted;
  /// The user who last updated the page.
  ulong updateUser;
  /// The item associated with the page.
  ulong itemId;
  /// The item list associated with the page.
  ulong itemListId;
  /// The module associated with the page.
  ulong moduleId;
  /// The time the page was last updated.
  @DbTimestamp DateTime timestamp;

  this() { super(); }
}
