import 'package:aoc2023/aoc2023.dart';
import '../utils/day_interface.dart';

class Day06 extends AbstractDay {
  Day06() : super(6);

  @override
  parseInput() {
    // TODO: implement parseInput
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
    int answer = 1;

    for (var game = 0; game < distances.length; game++) {
      int margin = 0;

      for (int hold = 0; hold <= times[game]; hold++) {
        if (hold * (times[game] - hold) > distances[game]) {
          margin += 1;
        }
      }

      answer *= margin;
    }
    return answer;
  }

  @override
  solvePart2() {
    List<int> time;
    List<int> distance;
    RegExp regExp = RegExp(r'-?\d+\.?\d*');
    var localInput = regExp.allMatches(input.asString);

    List<int> numbers = [];
    for (Match match in localInput) {
      numbers.add(int.parse(match.group(0)!));
    }

    time = [int.parse('${numbers[0]}${numbers[1]}${numbers[2]}${numbers[3]}')];
    distance = [
      int.parse('${numbers[4]}${numbers[5]}${numbers[6]}${numbers[7]}')
    ];
    int answer = 1;

    for (var game = 0; game < distance.length; game++) {
      int margin = 0;

      for (int hold = 0; hold <= time[game]; hold++) {
        if (hold * (time[game] - hold) > distance[game]) {
          margin += 1;
        }
      }

      answer *= margin;
    }
    return answer;
  }
}
