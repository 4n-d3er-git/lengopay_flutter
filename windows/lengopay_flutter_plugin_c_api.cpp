#include "include/lengopay_flutter/lengopay_flutter_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "lengopay_flutter_plugin.h"

void LengopayFlutterPluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  lengopay_flutter::LengopayFlutterPlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
