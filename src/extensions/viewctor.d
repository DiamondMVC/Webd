module webd.extensions.viewctor;

mixin template extension()
{
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
