// import 'package:flutter_test/flutter_test.dart';
// import 'package:daemon_app_usage/daemon_app_usage.dart';
// import 'package:daemon_app_usage/daemon_app_usage_platform_interface.dart';
// import 'package:daemon_app_usage/daemon_app_usage_method_channel.dart';
// import 'package:plugin_platform_interface/plugin_platform_interface.dart';

// class MockDaemonAppUsagePlatform
//     with MockPlatformInterfaceMixin
//     implements DaemonAppUsagePlatform {

//   @override
//   Future<String?> getPlatformVersion() => Future.value('42');
// }

// void main() {
//   final DaemonAppUsagePlatform initialPlatform = DaemonAppUsagePlatform.instance;

//   test('$MethodChannelDaemonAppUsage is the default instance', () {
//     expect(initialPlatform, isInstanceOf<MethodChannelDaemonAppUsage>());
//   });

//   test('getPlatformVersion', () async {
//     DaemonAppUsage daemonAppUsagePlugin = DaemonAppUsage();
//     MockDaemonAppUsagePlatform fakePlatform = MockDaemonAppUsagePlatform();
//     DaemonAppUsagePlatform.instance = fakePlatform;

//     expect(await daemonAppUsagePlugin.getPlatformVersion(), '42');
//   });
// }
