import 'package:flutter_test/flutter_test.dart';
import 'package:lengopay_flutter/lengopay_flutter.dart';
import 'package:lengopay_flutter/lengopay_flutter_platform_interface.dart';
import 'package:lengopay_flutter/lengopay_flutter_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockLengopayFlutterPlatform
    with MockPlatformInterfaceMixin
    implements LengopayFlutterPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final LengopayFlutterPlatform initialPlatform =
      LengopayFlutterPlatform.instance;

  test('$MethodChannelLengopayFlutter is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelLengopayFlutter>());
  });

  // test('getPlatformVersion', () async {
  //   LengopayFlutter lengopayFlutterPlugin = LengopayFlutter();
  //   MockLengopayFlutterPlatform fakePlatform = MockLengopayFlutterPlatform();
  //   LengopayFlutterPlatform.instance = fakePlatform;

  //   expect(await lengopayFlutterPlugin.getPlatformVersion(), '42');
  // });
}
