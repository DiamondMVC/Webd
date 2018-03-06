/**
* Copyright © Webd 2018
* License: MIT (https://github.com/DiamondMVC/Webd/blob/master/LICENSE)
* Author: Jacob Jensen (bausshf)
*/
module webd.dal.webparagraphs;

import diamond.database;

import webd.models.database;

/**
* Gets a range of paragraphs from their page id.
* Params:
*   pageId = The pageId of the web page.
* Returns:
*   A range of the paragraphs' db representation.
*/
auto getParagraphs(ulong pageId)
{
  static const sql = "SELECT * FROM @table WHERE `pageId` = @pageId AND `disabled` = '0' AND `deleted` = '0'";

  auto params = getParams();
  params["pageId"] = pageId;

  return MySql.readMany!WebdWebParagraph(sql, params);
}
