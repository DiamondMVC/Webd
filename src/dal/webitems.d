module webd.dal.webitems;

import diamond.database;

import webd.models.database;

auto getItem(ulong id)
{
  static const sql = "SELECT * FROM @table WHERE `id` = @id AND `disabled` = '0' AND `deleted` = '0' LIMIT 1";

  auto params = getParams();
  params["id"] = id;

  return MySql.readSingle!WebdWebItem(sql, params);
}

auto getItemValues(ulong itemId)
{
  static const sql = "SELECT * FROM @table WHERE `itemId` = @itemId AND `parentValue` IS NULL AND `deleted` = '0'";

  auto params = getParams();
  params["itemId"] = itemId;

  return MySql.readMany!WebdWebItemEntry(sql, params);
}

auto getItemValues(ulong itemId, ulong parentValue)
{
  static const sql = "SELECT * FROM @table WHERE `itemId` = @itemId AND `parentValue` = @parentValue AND `deleted` = '0'";

  auto params = getParams();
  params["itemId"] = itemId;
  params["parentValue"] = parentValue;

  return MySql.readMany!WebdWebItemEntry(sql, params);
}
