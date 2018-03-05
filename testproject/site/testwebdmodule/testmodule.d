module testmodule;

import diamond.views.view;

import webd.modules;
import webd.web;

private:

final class MyTestPageRenderSubscriber : PageRenderSubscriber
{
  final:
  this() { super(); }

  protected override void onRender(PageRenderArgs args)
  {
    args.view.append("<p>Module: " ~ args.page.get("module::name") ~ "</p>");
  }
}

shared static this()
{
  addModule("test", new MyTestPageRenderSubscriber);
}
