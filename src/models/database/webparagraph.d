module webd.models.database.webparagraph;

import diamond.database;

final class WebdWebParagraph : MySql.MySqlModel!"webd_web_paragraphs"
{
  public:
  @DbId ulong id;
  string name;
  string cssClasses;
  ulong pageId;
  ulong itemId;
  ulong itemListId;
  ulong moduleId;
  ulong sortOrder;
  string content;
  string templateView;
  bool disabled;
  bool deleted;
  ulong updateUser;
  @DbTimestamp DateTime timestamp;

  this() { super(); }
}
