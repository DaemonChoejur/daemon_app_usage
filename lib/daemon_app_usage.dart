// import 'daemon_app_usage_platform_interface.dart';

import 'dart:developer';
import 'dart:io';

import 'package:flutter/services.dart';

class DaemonAppUsage {
//   Future<String?> getPlatformVersion() {
//     return DaemonAppUsagePlatform.instance.getPlatformVersion();
//   }

  static const MethodChannel _methodChannel =
      MethodChannel('daemon_app_usage.methodChannel');

// Future<List<DaemonAppUsageDetail>>
  Future<void> getAppUsageData() async {
    if (Platform.isAndroid) {
      log('Calling getAppUsage() from flutter');
      await _methodChannel.invokeMethod("getAppUsage");
    }
  }
}
