/**
* Copyright © Webd 2018
* License: MIT (https://github.com/DiamondMVC/Webd/blob/master/LICENSE)
* Author: Jacob Jensen (bausshf)
*/
module webd.web.loop;

import webd.web.tagcollection;

/// Wrapper representing a loop of tags.
struct Loop
{
  private:
  /// The original collection of tags.
  TagCollection!()[] _original;
  /// A slice of the tags currently in the loop.
  TagCollection!()[] _items;

  public:
  @property
  {
    /// Gets the amount of items in the loop.
    size_t length() { return _original ? _original.length : 0; }
  }

  /// Boolean determining whether the loop is empty or not.
  bool empty()
  {
    return !_original || _original.length == 0 || (_items &&  !_items.length);
  }

  /// Gets the current item of the loop.
  TagCollection!() front()
  {
    if (!_items)
    {
      _items = _original;
    }

    return _items[0];
  }

  /// Pops the next item of the loop.
  void popFront()
  {
    _items = _items[1 .. $];
  }

  /// Adds an item to the loop.
  void add(TagCollection!() tags)
  {
    _original ~= tags;
  }

  /// Duplicates the original loop.
  Loop dup()
  {
    Loop loop;
    loop._original = _original;

    return loop;
  }
}
