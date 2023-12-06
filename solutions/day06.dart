import '../utils/day_interface.dart';

class Day06 extends AbstractDay {
  Day06() : super(6);

  @override
  parseInput() {
    // TODO: implement parseInput

    // throw UnimplementedError();
  }

  @override
  solvePart1() {
    List<int> times;
    List<int> distances;
    RegExp regExp = RegExp(r'-?\d+\.?\d*');
    var localInput = regExp.allMatches(input.asString);

    List<int> numbers = [];
    for (Match match in localInput) {
      numbers.add(int.parse(match.group(0)!));
    }

    times = [numbers[0], numbers[1], numbers[2], numbers[3]];
    distances = [numbers[4], numbers[5], numbers[6], numbers[7]];
    print(times);

    return '';
  }

  @override
  solvePart2() {
    return 'uw vader';
  }
}
