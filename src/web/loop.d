module webd.web.loop;

import webd.web.tagcollection;

struct Loop
{
  private:
  TagCollection!()[] _original;
  TagCollection!()[] _items;

  public:
  @property
  {
    size_t length() { return _original ? _original.length : 0; }
  }

  bool empty()
  {
    return !_original || _original.length == 0 || (_items &&  !_items.length);
  }

  TagCollection!() front()
  {
    if (!_items)
    {
      _items = _original;
    }

    return _items[0];
  }

  void popFront()
  {
    _items = _items[1 .. $];
  }

  void add(TagCollection!() tags)
  {
    _original ~= tags;
  }

  Loop dup()
  {
    Loop loop;
    loop._original = _original;

    return loop;
  }
}
