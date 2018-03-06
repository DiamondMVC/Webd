/**
* Copyright © Webd 2018
* License: MIT (https://github.com/DiamondMVC/Webd/blob/master/LICENSE)
* Author: Jacob Jensen (bausshf)
*/
module webd.extensions.viewctor;

/// Extensions for the view constructor.
mixin template extension()
{
  /// The extended view constructor.
  void onViewCtor()
  {
    import webd.web;

    auto page = _client.getContext!Page("page");

    if (page)
    {
      _webd_page = page;
    }
    else
    {
      _webd_page = new Page;
      _client.addContext("page", _webd_page);
    }
  }
}
