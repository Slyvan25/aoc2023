import '../test/utils/input_util.dart';

abstract class AbstractDay {
  AbstractDay(this.day) : input = InputUtil(day);

  final int day;
  final InputUtil input;

  dynamic parseInput();
  dynamic solvePart1();
  dynamic solvePart2();

  void printSolutions({DayPart part = DayPart.all}) {
    print('___________________________');
    print('         Day $day          ');
    if (part == DayPart.part1 || part == DayPart.all) {
      print(
          'This elve is going to commit warcrimes by answering you this first question: \n ${solvePart1()}\n');
    }
    if (part == DayPart.part2 || part == DayPart.all) {
      print(
          'This elve is going to commit warcrimes by answering you this second question: \n ${solvePart2()}\n');
    }
    print('___________________________');
  }
}

enum DayPart {
  part1('1'),
  part2('2'),
  all('all');

  const DayPart(this.value);

  final String value;

  static DayPart parse(String input) {
    return DayPart.values.firstWhere(
      (e) => e.value == input,
      orElse: () =>
          throw ArgumentError.value(input, 'input', 'Invalid day part'),
    );
  }
}
