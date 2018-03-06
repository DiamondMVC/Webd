/**
* Copyright © Webd 2018
* License: MIT (https://github.com/DiamondMVC/Webd/blob/master/LICENSE)
* Author: Jacob Jensen (bausshf)
*/
module webd.models.database.website;

import diamond.database;

/// Db representation of a website.
final class WebdWebsite : MySql.MySqlModel!"webd_websites"
{
  public:
  /// The id of the website.
  @DbId ulong id;
  /// The name of the website.
  string name;
  /// The language of the website.
  string language;
  /// The user who last updated the website.
  ulong updateUser;
  /// The time the website was last updated.
  @DbTimestamp DateTime timestamp;

  this() { super(); }
}
