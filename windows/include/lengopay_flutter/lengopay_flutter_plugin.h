#ifndef FLUTTER_PLUGIN_LENGOPAY_FLUTTER_PLUGIN_H_
#define FLUTTER_PLUGIN_LENGOPAY_FLUTTER_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>
#include <memory>

namespace lengopay_flutter {

class LengopayFlutterPlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows* registrar);

  LengopayFlutterPlugin();
  virtual ~LengopayFlutterPlugin();

  // Disallow copy and assign.
  LengopayFlutterPlugin(const LengopayFlutterPlugin&) = delete;
  LengopayFlutterPlugin& operator=(const LengopayFlutterPlugin&) = delete;

  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue>& method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace lengopay_flutter

#endif  // FLUTTER_PLUGIN_LENGOPAY_FLUTTER_PLUGIN_H_
