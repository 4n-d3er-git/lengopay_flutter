import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'lengopay_flutter_platform_interface.dart';

/// An implementation of [LengopayFlutterPlatform] that uses method channels.
class MethodChannelLengopayFlutter extends LengopayFlutterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('lengopay_flutter');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
