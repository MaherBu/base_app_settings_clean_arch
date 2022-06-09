import 'package:fimber/fimber.dart';
import 'package:flutter/foundation.dart';
import 'package:service_provider/base/utils/fimber/crash_reporting_tree.dart';
import 'package:service_provider/base/utils/fimber/fimber.dart';

class LoggerImpl extends Logger {
  LoggerImpl() {
    final LogTree tree = kReleaseMode ? CrashReportingTree() : DebugTree();
    Fimber.plantTree(tree);
  }
}