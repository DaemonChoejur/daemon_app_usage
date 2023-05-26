class DaemonAppUsageDetail {
  final String _packageName, _appName;
  final Duration _usage;

  DaemonAppUsageDetail({
    required String packageName,
    required String appName,
    required Duration usage,
  })  : _packageName = packageName,
        _appName = appName,
        _usage = usage;

  String get appName => _appName;

  String get packageName => _packageName;

  Duration get usage => _usage;

  @override
  String toString() {
    return 'DaemonAppUsage: $packageName - $appName : Duration: $usage';
  }
}
