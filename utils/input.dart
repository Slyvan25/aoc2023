import 'dart:io';
import 'package:meta/meta.dart';
import 'package:path/path.dart' as path;

class InputUtil {
  InputUtil(
    int day,
  )   : _inputAsString = _readInputDay(day),
        _inputAsList = _readInputDayAsList(day);
  String _inputAsString;

  @visibleForTesting
  set inputAsString(String input) => _inputAsString = input;

  List<String> _inputAsList;

  @visibleForTesting
  set inputAsList(List<String> input) => _inputAsList = input;

  static String _createInputPath(int day) {
    final dayString = day.toString().padLeft(2, '0');
    return './input/aoc$dayString.txt';
  }

  static String _readInputDay(int day) {
    return _readInput(_createInputPath(day));
  }

  static String _readInput(String input) {
    return File(input).readAsStringSync();
  }

  static List<String> _readInputDayAsList(int day) {
    return _readInputAsList(_createInputPath(day));
  }

  static List<String> _readInputAsList(String input) {
    return File(input).readAsLinesSync();
  }

  //return as string
  String get asString => _inputAsString;

  // Splits the input String by `whitespace` and `newline`.
  List<String> getPerWhitespaces() {
    return _inputAsString.split(RegExp(r'\s\n'));
  }

  List<String> getBy(String pattern) {
    return _inputAsString.split(pattern);
  }
}
