/**
* Copyright © Webd 2018
* License: MIT (https://github.com/DiamondMVC/Webd/blob/master/LICENSE)
* Author: Jacob Jensen (bausshf)
*/
module webd.extensions.view;

/// Extensions for views.
mixin template extensions()
{
  import webd.web.page;

  /// The page associated with the view.
  private Page _webd_page;

  @property
  {
    /// Gets the page associated with the view.
    public Page page()
    {
      if (!_webd_page)
      {
        _webd_page = new Page;

        _webd_page.add("Page::Test", "Hello Tags!");
      }

      return _webd_page;
    }
  }

  import webd.models : WebdWebItem;

  /**
  * Generates tags for an item.
  * Params:
  *   itemId = The item id.
  *   strict = Boolean determining whether the tag generation is strict or not. If it's strict it will throw a 404, else it will just return null for the item.
  * Returns:
  *   The item that generated the tags' db representation. Returns null if it's non-strict and the item doesn't exist.
  */
  WebdWebItem generateItemTags(ulong itemId, bool strict = true)
  {
    import webd.web;
    import webd.dal;

    auto item = getItem(itemId);

    if (!item)
    {
      if (strict)
      {
        client.notFound();
      }

      return null;
    }

    page.add("item::name", item.name);

    auto itemValues = getItemValues(item.id);

    Loop values;

    foreach (itemValue; itemValues)
    {
      auto itemValueTags = new TagCollection!();
      values.add(itemValueTags);
      auto tagName = "item::value::" ~ itemValue.name;

      itemValueTags.add("name", itemValue.name);
      itemValueTags.add("type", itemValue.type);

      switch (itemValue.type)
      {
        case "text":
        case "longText":
        case "image":
        case "html":
        {
          itemValueTags.add("value", itemValue.textValue);
          page.add(tagName, itemValue.textValue);
          break;
        }

        case "number":
        {
          itemValueTags.add("value", itemValue.numericValue);
          page.add(tagName, itemValue.numericValue);
          break;
        }

        case "decimalNumber":
        {
          itemValueTags.add("value", itemValue.decimalValue);
          page.add(tagName, itemValue.decimalValue);
          break;
        }

        case "datetime":
        case "date":
        case "time":
        {
          itemValueTags.add("value", itemValue.datetimeValue);
          page.add(tagName, itemValue.datetimeValue);
          break;
        }

        case "boolean":
        {
          itemValueTags.add("value", itemValue.booleanValue);
          page.add(tagName, itemValue.booleanValue);
          break;
        }

        case "values":
        {
          auto childValues = getItemValues(item.id, itemValue.id);

          Loop childValuesLoop;

          foreach (childValue; childValues)
          {
            auto childItemValueTags = new TagCollection!();
            childItemValueTags.add("name", childValue.name);
            childItemValueTags.add("type", childValue.type);

            childValuesLoop.add(childItemValueTags);

            switch (childValue.type)
            {
              case "text":
              case "longText":
              case "image":
              case "html":
              {
                childItemValueTags.add("value", childValue.textValue);
                page.add(tagName ~ "::" ~ childValue.name, childValue.textValue);
                break;
              }

              case "number":
              {
                childItemValueTags.add("value", childValue.numericValue);
                page.add(tagName ~ "::" ~ childValue.name, childValue.numericValue);
                break;
              }

              case "decimalNumber":
              {
                childItemValueTags.add("value", childValue.decimalValue);
                page.add(tagName ~ "::" ~ childValue.name, childValue.decimalValue);
                break;
              }

              case "datetime":
              case "date":
              case "time":
              {
                childItemValueTags.add("value", childValue.datetimeValue);
                page.add(tagName ~ "::" ~ childValue.name, childValue.datetimeValue);
                break;
              }

              case "boolean":
              {
                childItemValueTags.add("value", childValue.booleanValue);
                page.add(tagName ~ "::" ~ childValue.name, childValue.booleanValue);
                break;
              }

              default: break;
            }
          }

          itemValueTags.add("values", childValuesLoop);
          break;
        }

        default: break;
      }
    }

    page.add("item::values", values);

    return item;
  }
}
