module webd.dal.webparagraphs;

import diamond.database;

import webd.models.database;

auto getParagraphs(ulong pageId)
{
  static const sql = "SELECT * FROM @table WHERE `pageId` = @pageId AND `disabled` = '0' AND `deleted` = '0'";

  auto params = getParams();
  params["pageId"] = pageId;

  return MySql.readMany!WebdWebParagraph(sql, params);
}
