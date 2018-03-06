/**
* Copyright © Webd 2018
* License: MIT (https://github.com/DiamondMVC/Webd/blob/master/LICENSE)
* Author: Jacob Jensen (bausshf)
*/
module webd.dal.webitemlists;

import diamond.database;

import webd.models.database;

/**
* Gets an item list from its id.
* Params:
*   id = The id of the item list.
* Returns:
*   The item list's db representation.
*/
auto getItemList(ulong id)
{
  static const sql = "SELECT * FROM @table WHERE `id` = @id AND `deleted` = '0' LIMIT 1";

  auto params = getParams();
  params["id"] = id;

  return MySql.readSingle!WebdWebItemList(sql, params);
}
