/**
* Copyright © Webd 2018
* License: MIT (https://github.com/DiamondMVC/Webd/blob/master/LICENSE)
* Author: Jacob Jensen (bausshf)
*/
module webd.modules.basemodules;

import diamond.views.view;

import webd.modules;
import webd.web.page;

/// Page render arguments.
final class PageRenderArgs
{
  private:
  /// The view.
  View _view;
  /// The page.
  Page _page;

  public:
  /**
  * Creates new page render arguments.
  * Params:
  *   view = The view getting rendered.
  *   page = The page getting rendered.
  */
  this(View view, Page page)
  {
    _view = view;
    _page = page;
  }

  @property
  {
    /// Gets the view getting rendered.
    View view() { return _view; }

    /// Gets the page getting rendered.
    Page page() { return _page; }
  }
}

/// Wrapper around a page render subscriber.
abstract class PageRenderSubscriber : ModulePackage
{
  protected:
  /// Creates a new page render subscriber.
  this()
  {
    subscribeEvent("render", new ModuleAction!PageRenderArgs(&handleRender));
  }

  /// Override this to handle the rendering of a page.
  abstract void onRender(PageRenderArgs args);

  private:
  /**
  * Handles the rendering of a page.
  * Params:
  *   args = The page render arguments.
  */
  void handleRender(PageRenderArgs args)
  {
    onRender(args);
  }
}
