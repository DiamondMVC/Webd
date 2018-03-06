/**
* Copyright © Webd 2018
* License: MIT (https://github.com/DiamondMVC/Webd/blob/master/LICENSE)
* Author: Jacob Jensen (bausshf)
*/
module webd.dal.webitems;

import diamond.database;

import webd.models.database;

/**
* Gets an item from its id.
* Params:
*   id = The id of the item.
* Returns:
*   The item's db representation.
*/
auto getItem(ulong id)
{
  static const sql = "SELECT * FROM @table WHERE `id` = @id AND `disabled` = '0' AND `deleted` = '0' LIMIT 1";

  auto params = getParams();
  params["id"] = id;

  return MySql.readSingle!WebdWebItem(sql, params);
}

/**
* Gets a range of an item's values.
* Params:
*   itemId = The id of the item.
* Returns:
*   A range of the item values' db representation.
*/
auto getItemValues(ulong itemId)
{
  static const sql = "SELECT * FROM @table WHERE `itemId` = @itemId AND `parentValue` IS NULL AND `deleted` = '0'";

  auto params = getParams();
  params["itemId"] = itemId;

  return MySql.readMany!WebdWebItemEntry(sql, params);
}

/**
* Gets a range of an item's sub-values.
* Params:
*   itemId =      The id of the item.
*   parentValue = The id of the parent item value.
* Returns:
*   A range of the item values' db representation.
*/
auto getItemValues(ulong itemId, ulong parentValue)
{
  static const sql = "SELECT * FROM @table WHERE `itemId` = @itemId AND `parentValue` = @parentValue AND `deleted` = '0'";

  auto params = getParams();
  params["itemId"] = itemId;
  params["parentValue"] = parentValue;

  return MySql.readMany!WebdWebItemEntry(sql, params);
}
