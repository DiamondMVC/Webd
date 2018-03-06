/**
* Copyright © Webd 2018
* License: MIT (https://github.com/DiamondMVC/Webd/blob/master/LICENSE)
* Author: Jacob Jensen (bausshf)
*/
module webd.core.config;

import vibe.data.serialization : optional;

/// Webd configurations.
class WebdConfig
{
  /// The name of the website.
  string websiteName;

  /// The root path of the website.
  @optional string rootPath;

  /// The language.
  @optional string language;
}

/// The webd configuration.
private static __gshared WebdConfig _webdConfig;

/// Gets the webd configuration.
@property WebdConfig webdConfig() { return _webdConfig; }

/// Loads the webd configuration.
void loadWebdConfig()
{
  import vibe.d : deserializeJson;
  import std.file : readText;

  _webdConfig = deserializeJson!WebdConfig(readText("config/webd.json"));

  import std.file : thisExePath;
  import std.path : dirName, absolutePath;

  if (!_webdConfig.rootPath)
  {
    _webdConfig.rootPath = absolutePath(dirName(thisExePath));
  }

  import webd.dal;
  auto website = getWebsite(_webdConfig.websiteName);

  if (website)
  {
    if (!_webdConfig.language)
    {
      _webdConfig.language = website.language;
    }
  }
}
