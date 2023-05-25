
import 'daemon_app_usage_platform_interface.dart';

class DaemonAppUsage {
  Future<String?> getPlatformVersion() {
    return DaemonAppUsagePlatform.instance.getPlatformVersion();
  }
}
