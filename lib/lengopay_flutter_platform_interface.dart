import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'lengopay_flutter_method_channel.dart';

abstract class LengopayFlutterPlatform extends PlatformInterface {
  /// Constructs a LengopayFlutterPlatform.
  LengopayFlutterPlatform() : super(token: _token);

  static final Object _token = Object();

  static LengopayFlutterPlatform _instance = MethodChannelLengopayFlutter();

  /// The default instance of [LengopayFlutterPlatform] to use.
  ///
  /// Defaults to [MethodChannelLengopayFlutter].
  static LengopayFlutterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [LengopayFlutterPlatform] when
  /// they register themselves.
  static set instance(LengopayFlutterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
