module webd.dal.modules;

import diamond.database;

import webd.models.database;

auto getModule(ulong id)
{
  static const sql = "SELECT * FROM @table WHERE `id` = @id AND `deleted` = '0' LIMIT 1";

  auto params = getParams();
  params["id"] = id;

  return MySql.readSingle!WebdModule(sql, params);
}
