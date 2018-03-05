module webd.dal.webpages;

import diamond.database;

import webd.models.database;

auto getWebPage(string name)
{
  static const sql = "SELECT * FROM @table WHERE `name` = @name AND `published` = '1' AND `deleted` = '0' LIMIT 1";

  auto params = getParams();
  params["name"] = name;

  return MySql.readSingle!WebdWebPage(sql, params);
}

auto getWebPageFromRoute(string route)
{
  static const sql = "SELECT * FROM @table WHERE `route` = @route AND `published` = '1' AND `deleted` = '0' LIMIT 1";

  auto params = getParams();
  params["route"] = route;

  return MySql.readSingle!WebdWebPage(sql, params);
}

auto getWebPage(ulong id)
{
  static const sql = "SELECT * FROM @table WHERE `id` = @id AND `published` = '1' AND `deleted` = '0' LIMIT 1";

  auto params = getParams();
  params["id"] = id;

  return MySql.readSingle!WebdWebPage(sql, params);
}

auto getAllWebPages()
{
  static const sql = "SELECT * FROM @table WHERE `published` = '1' AND `deleted` = '0' ORDER BY `id` DESC";

  return MySql.readMany!WebdWebPage(sql, null);
}

WebdWebPage[] getAllSubWebPages(ulong parentPageId)
{
  static const sql = "SELECT * FROM @table WHERE `parentPage` = @parentPage AND `published` = '1' AND `deleted` = '0' ORDER BY `id` DESC";
  auto params = getParams();
  params["parentPage"] = parentPageId;

  import std.array : array;

  auto result = MySql.readMany!WebdWebPage(sql, params).array;

  foreach (page; result)
  {
    result ~= getAllSubWebPages(page.id);
  }

  return result;
}

auto getAllDeletedWebPages()
{
  static const sql = "SELECT * FROM @table WHERE `deleted` = '1' ORDER BY `id` DESC";

  return MySql.readMany!WebdWebPage(sql, null);
}
