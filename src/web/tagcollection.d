module webd.web.tagcollection;

import std.variant : Variant;

import webd.web.loop;

class TagCollection(string tagName = "tags")
{
  private
  Variant[string] _values;
  TagCollection!tagName _tags;

  public:
  @property
  {
    auto keys() { return _values.keys; }
  }

  void add(T = string)(string key, T value)
  {
    _values[key] = value;
  }

  void remove(string key)
  {
    if (_values)
    {
      _values.remove(key);
    }
  }

  bool has(string key)
  {
    return _values && key in _values;
  }

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

  Loop getLoop(string name)
  {
    return get!Loop(name);
  }

  void clearTags()
  {
    if (_values)
    {
      _values.clear();
    }
  }

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

  void createTags()
  {
    _tags = new TagCollection!tagName;
  }

  @property
  {
    mixin("TagCollection " ~ tagName  ~ "() { return _tags; }");
  }
}
