import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'daemon_app_usage_method_channel.dart';

abstract class DaemonAppUsagePlatform extends PlatformInterface {
  /// Constructs a DaemonAppUsagePlatform.
  DaemonAppUsagePlatform() : super(token: _token);

  static final Object _token = Object();

  static DaemonAppUsagePlatform _instance = MethodChannelDaemonAppUsage();

  /// The default instance of [DaemonAppUsagePlatform] to use.
  ///
  /// Defaults to [MethodChannelDaemonAppUsage].
  static DaemonAppUsagePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DaemonAppUsagePlatform] when
  /// they register themselves.
  static set instance(DaemonAppUsagePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
