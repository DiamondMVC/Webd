/**
* Copyright © Webd 2018
* License: MIT (https://github.com/DiamondMVC/Webd/blob/master/LICENSE)
* Author: Jacob Jensen (bausshf)
*/
module webd.web.tagcollection;

import std.variant : Variant;

import webd.web.loop;

/// Wrapper around a tag collection.
class TagCollection(string tagName = "tags")
{
  private
  /// The tags of the collection.
  Variant[string] _values;
  /// An inner collection of tags.
  TagCollection!tagName _tags;

  public:
  @property
  {
    /// Gets the keys of the tags.
    auto keys() { return _values.keys; }
  }

  /**
  * Adds a tag to the collection.
  * Params:
  *   key =   The key of the tag.
  *   value = The value of the tag.
  */
  void add(T = string)(string key, T value)
  {
    _values[key] = value;
  }

  /**
  * Removes a tag from the collection.
  * Params:
  *   key =   The key of the tag.
  */
  void remove(string key)
  {
    if (_values)
    {
      _values.remove(key);
    }
  }

  /**
  * Checks whether a key exist in the collection or not.
  * Params:
  *   key = The key to check for existence.
  * Returns:
  *   Returns true if the key exist, false otherwise.
  */
  bool has(string key)
  {
    return _values && key in _values;
  }

  /**
  * Gets the value of a tag in the collection.
  * Params:
  *   name =         The name of the tag.
  *   defaultValue = The default value to return if the tag doesn't exist.
  * Returns:
  *   The value of the tag, else the default value.
  */
  T get(T = string)(string name, lazy T defaultValue = T.init)
  {
    if (!_values)
    {
      return defaultValue;
    }

    import std.variant : Variant;
    Variant value = _values.get(name, Variant.init);

    if (!value.hasValue)
    {
      return defaultValue;
    }

    return value.get!T;
  }

  /*
  * Gets a loop from the collection.
  * Params:
  *   name = The name of the loop.
  * Returns:
  *   The loop if existing, else an empty loop range.
  */
  Loop getLoop(string name)
  {
    return get!Loop(name);
  }

  /// Clears all tags.
  void clearTags()
  {
    if (_values)
    {
      _values.clear();
    }
  }

  /**
  * Clears tags based on a tag prefix ex. "page::", "item::" etc.
  * Params:
  *   tagPrefix = The tag prefix.
  */
  void clearTags(string tagPrefix)
  {
    import std.algorithm : startsWith;

    string[] keysToRemove;

    foreach (key; keys)
    {
      if (key.startsWith(tagPrefix))
      {
        keysToRemove ~= key;
      }
    }

    foreach (keyToRemove; keysToRemove)
    {
      _values.remove(keyToRemove);
    }
  }

  /// Creates an inner tag collection.
  void createTags()
  {
    _tags = new TagCollection!tagName;
  }

  @property
  {
    /// Gets the inner tag collection.
    mixin("TagCollection " ~ tagName  ~ "() { return _tags; }");
  }
}
