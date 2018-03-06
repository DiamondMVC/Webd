/**
* Copyright © Webd 2018
* License: MIT (https://github.com/DiamondMVC/Webd/blob/master/LICENSE)
* Author: Jacob Jensen (bausshf)
*/
module webd.models.database.modulepackage;

import diamond.database;

/// Db representation of a module.
final class WebdModule : MySql.MySqlModel!"webd_modules"
{
  public:
  /// The id.
  @DbId ulong id;
  /// The name.
  string name;
  /// The css classes.
  string cssClasses;
  /// Boolean determining whether the module is disabled or not.
  bool disabled;
  /// Boolean determining whether the module has been deleted or not.
  bool deleted;
  /// The user who updated the module last.
  ulong updateUser;
  /// The time the module was last updated.
  @DbTimestamp DateTime timestamp;
  
  this() { super(); }
}
