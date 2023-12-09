import 'dart:io';
import 'package:collection/collection.dart';

import '../utils/day_interface.dart';
import '../solutions/index.dart';

void main(List<String> arguments) {
  //read arguments and assign them to variables
  String inputDay = '';
  String parts = '';
  final String argSeperator = '=';

  //initialize day classes
  final days = <AbstractDay>[
    Day06(),
    Day07(),
  ];

  String getArgumentValue({required String argument}) {
    return argument.split(argSeperator).last;
  }

  void printAllSolution({required bool enabled}) {
    if (enabled) {
      for (final day in days) {
        day.printSolutions();
      }
      return;
    }
    exit(0);
  }

  void printSolutionForDay(int day, DayPart part) {
    final daySolution = days.firstWhereOrNull((e) => e.day == day);
    if (daySolution == null) {
      print('No solution found for day $day');
    } else {
      daySolution.printSolutions(part: part);
    }
  }

  // parse argument input
  if (arguments.isNotEmpty) {
    for (final argument in arguments) {
      if (argument.contains('day')) {
        inputDay = getArgumentValue(argument: argument);
      }
      if (argument.contains('part')) {
        parts = getArgumentValue(argument: argument);

        switch (parts) {
          case 'all':
            printAllSolution(enabled: true);
            break;
          case '1':
            printSolutionForDay(int.parse(inputDay), DayPart.part1);
            break;
          case '2':
            printSolutionForDay(int.parse(inputDay), DayPart.part2);
            break;
        }
      }
    }
  } else {
    print('No arguments found! please use this tool by like:\nday=6 part=all');
  }
}
