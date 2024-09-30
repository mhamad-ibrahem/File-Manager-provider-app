
import 'dart:developer';



class LogHelper {
  static logSuccess(String text) {
    log('\x1B[32m$text\x1B[0m');
  }

  static logError(String text) {
    log('\x1B[31m$text\x1B[0m');
  }

  void logWarning(String text) {
    log('\x1B[33m$text\x1B[0m');
  }
    static logCyan(String text) {
    log('\x1B[36m$text\x1B[0m');
  }

  static logMagenta(String text) {
    log('\x1B[35m$text\x1B[0m');
  }
}
