/**
* Copyright © Webd 2018
* License: MIT (https://github.com/DiamondMVC/Webd/blob/master/LICENSE)
* Author: Jacob Jensen (bausshf)
*/
module webd.dal.webpages;

import diamond.database;

import webd.models.database;

/**
* Gets an web page from its name.
* Params:
*   name = The name of the web page.
* Returns:
*   The web page's db representation.
*/
auto getWebPage(string name)
{
  static const sql = "SELECT * FROM @table WHERE `name` = @name AND `published` = '1' AND `deleted` = '0' LIMIT 1";

  auto params = getParams();
  params["name"] = name;

  return MySql.readSingle!WebdWebPage(sql, params);
}

/**
* Gets an web page from its route.
* Params:
*   route = The route of the web page.
* Returns:
*   The web page's db representation.
*/
auto getWebPageFromRoute(string route)
{
  static const sql = "SELECT * FROM @table WHERE `route` = @route AND `published` = '1' AND `deleted` = '0' LIMIT 1";

  auto params = getParams();
  params["route"] = route;

  return MySql.readSingle!WebdWebPage(sql, params);
}

/**
* Gets an web page from its id.
* Params:
*   id = The id of the web page.
* Returns:
*   The web page's db representation.
*/
auto getWebPage(ulong id)
{
  static const sql = "SELECT * FROM @table WHERE `id` = @id AND `published` = '1' AND `deleted` = '0' LIMIT 1";

  auto params = getParams();
  params["id"] = id;

  return MySql.readSingle!WebdWebPage(sql, params);
}

/**
* Gets a range of all web pages.
* Returns:
*   A range of the web pages' db representation.
*/
auto getAllWebPages()
{
  static const sql = "SELECT * FROM @table WHERE `published` = '1' AND `deleted` = '0' ORDER BY `id` DESC";

  return MySql.readMany!WebdWebPage(sql, null);
}

/**
* Gets an array of all sub web pages.
* Params:
*   parentPageId = The id of the parent page.
* Returns:
*   An array of the sub web pages' db representation.
*/
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

/**
* Gets a range of all deleted web pages.
* Returns:
*   The range of the deleted web pages' db representation.
*/
auto getAllDeletedWebPages()
{
  static const sql = "SELECT * FROM @table WHERE `deleted` = '1' ORDER BY `id` DESC";

  return MySql.readMany!WebdWebPage(sql, null);
}
