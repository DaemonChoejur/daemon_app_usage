import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:daemon_app_usage/daemon_app_usage_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelDaemonAppUsage platform = MethodChannelDaemonAppUsage();
  const MethodChannel channel = MethodChannel('daemon_app_usage');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
