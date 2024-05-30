import 'dart:async' show Zone;
import 'dart:developer' show log;

import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';

class LogUtility {
  static void info(String message) {
    _log(message, name: 'INFO', level: 200, color: Colors.green);
  }

  static void warning(String message) {
    _log(message, name: 'WARNING', level: 1000, color: Colors.yellow);
  }

  static void error(String message, {dynamic error, StackTrace? stackTrace}) {
    _log(message,
        name: 'ERROR', level: 2000, color: Colors.red, error: error, stackTrace: stackTrace);
  }

  static void customLog(dynamic msg,
      {String name = 'LOG', Object? error, StackTrace? stackTrace, Color? color}) {
    if (kDebugMode) {
      // print(msg);
      _log(
        (msg ?? '').toString(),
        name: name,
        error: error,
        stackTrace: stackTrace,
        time: DateTime.now(),
        level: 0,
        color: color,
      );
    }
  }

  static void _log(String message,
      {DateTime? time,
      int? sequenceNumber,
      int level = 0,
      String name = '',
      Zone? zone,
      Object? error,
      StackTrace? stackTrace,
      Color? color}) {
    final colorCode = color != null ? _getColorCode(color) : '';
    const resetColorCode = '\x1B[0m';
    final logMessage = '$colorCode$message$resetColorCode';
    if (kDebugMode) {
      log(
        logMessage,
        time: time,
        sequenceNumber: sequenceNumber,
        level: level,
        name: name,
        zone: zone,
        error: error,
        stackTrace: stackTrace,
      );
    }
  }

  static String _getColorCode(Color color) {
    if (color == Colors.red) {
      return '\x1B[31m';
    } else if (color == Colors.green) {
      return '\x1B[32m';
    } else if (color == Colors.yellow) {
      return '\x1B[33m';
    } else {
      return '';
    }
  }
}
