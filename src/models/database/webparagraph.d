/**
* Copyright © Webd 2018
* License: MIT (https://github.com/DiamondMVC/Webd/blob/master/LICENSE)
* Author: Jacob Jensen (bausshf)
*/
module webd.models.database.webparagraph;

import diamond.database;

/// Db representation of a paragraph.
final class WebdWebParagraph : MySql.MySqlModel!"webd_web_paragraphs"
{
  public:
  /// The id of the paragraph.
  @DbId ulong id;
  /// The name of the paragraph.
  string name;
  /// The css classes.
  string cssClasses;
  /// The page id.
  ulong pageId;
  /// The item associated with the paragraph.
  ulong itemId;
  /// The item list associated with the paragraph.
  ulong itemListId;
  /// The module associated with the paragraph.
  ulong moduleId;
  /// The sort order.
  ulong sortOrder;
  /// The html content of the paragraph.
  string content;
  /// The template view of the paragraph.
  string templateView;
  /// Boolean determining whether the paragraph has been disabled or not.
  bool disabled;
  /// Boolean determining whether the paragraph has been deleted or not.
  bool deleted;
  /// The user who last updated the paragraph.
  ulong updateUser;
  /// The time the paragraph was last updated.
  @DbTimestamp DateTime timestamp;

  this() { super(); }
}
