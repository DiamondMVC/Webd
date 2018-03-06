/**
* Copyright © Webd 2018
* License: MIT (https://github.com/DiamondMVC/Webd/blob/master/LICENSE)
* Author: Jacob Jensen (bausshf)
*/
module webd.dal.websites;

import diamond.database;

import webd.models.database;

/**
* Gets website from its name.
* Params:
*   name = The name of the website.
* Returns:
*   The website's db representation.
*/
auto getWebsite(string name)
{
  static const sql = "SELECT * FROM @table WHERE `name` = @name LIMIT 1";

  auto params = getParams();
  params["name"] = name;

  return MySql.readSingle!WebdWebsite(sql, params);
}

/**
* Gets website from its id.
* Params:
*   id = The id of the website.
* Returns:
*   The website's db representation.
*/
auto getWebsite(ulong id)
{
  static const sql = "SELECT * FROM @table WHERE `id` = @id LIMIT 1";

  auto params = getParams();
  params["id"] = id;

  return MySql.readSingle!WebdWebsite(sql, params);
}

/**
* Gets a range of all websites.
* Returns:
*   A range of all the websites' db representation.
*/
auto getAllWebsites()
{
  static const sql = "SELECT * FROM @table WHERE ORDER BY `id` DESC";

  return MySql.readMany!WebdWebsite(sql, null);
}
