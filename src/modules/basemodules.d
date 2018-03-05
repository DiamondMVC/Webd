module webd.modules.basemodules;

import diamond.views.view;

import webd.modules;
import webd.web.page;


final class PageRenderArgs
{
  private:
  View _view;
  Page _page;

  public:
  this(View view, Page page)
  {
    _view = view;
    _page = page;
  }

  @property
  {
    View view() { return _view; }

    Page page() { return _page; }
  }
}
abstract class PageRenderSubscriber : ModulePackage
{
  protected:
  this()
  {
    subscribeEvent("render", new ModuleAction!PageRenderArgs(&handleRender));
  }

  abstract void onRender(PageRenderArgs args);

  private:
  void handleRender(PageRenderArgs args)
  {
    onRender(args);
  }
}
