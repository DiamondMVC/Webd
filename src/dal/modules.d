/**
* Copyright © Webd 2018
* License: MIT (https://github.com/DiamondMVC/Webd/blob/master/LICENSE)
* Author: Jacob Jensen (bausshf)
*/
module webd.dal.modules;

import diamond.database;

import webd.models.database;

/**
* Gets a module from its id.
* Params:
*   id = The id of the module.
* Returns:
*   The module's db representation.
*/
auto getModule(ulong id)
{
  static const sql = "SELECT * FROM @table WHERE `id` = @id AND `deleted` = '0' LIMIT 1";

  auto params = getParams();
  params["id"] = id;

  return MySql.readSingle!WebdModule(sql, params);
}
