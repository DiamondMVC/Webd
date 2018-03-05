module webd.dal.websites;

import diamond.database;

import webd.models.database;

auto getWebsite(string name)
{
  static const sql = "SELECT * FROM @table WHERE `name` = @name LIMIT 1";

  auto params = getParams();
  params["name"] = name;

  return MySql.readSingle!WebdWebsite(sql, params);
}

auto getWebsite(ulong id)
{
  static const sql = "SELECT * FROM @table WHERE `id` = @id LIMIT 1";

  auto params = getParams();
  params["id"] = id;

  return MySql.readSingle!WebdWebsite(sql, params);
}

auto getAllWebsites()
{
  static const sql = "SELECT * FROM @table WHERE ORDER BY `id` DESC";

  return MySql.readMany!WebdWebsite(sql, null);
}
