// import 'daemon_app_usage_platform_interface.dart';

import 'dart:io';

import 'package:daemon_app_usage/src/daemon_app_usage_detail.dart';
import 'package:flutter/services.dart';

class DaemonAppUsage {
//   Future<String?> getPlatformVersion() {
//     return DaemonAppUsagePlatform.instance.getPlatformVersion();
//   }

  static const MethodChannel _methodChannel =
      const MethodChannel('daemon_app_usage');

  // Future<List<DaemonAppUsageDetail>> getAppUsageData() async {
  //   if (Platform.isAndroid) {
  //     Map usage = await _methodChannel.invokeMethod("getAppUsage");
  //   }
  // }
}
