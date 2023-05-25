import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'daemon_app_usage_platform_interface.dart';

/// An implementation of [DaemonAppUsagePlatform] that uses method channels.
class MethodChannelDaemonAppUsage extends DaemonAppUsagePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('daemon_app_usage');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
