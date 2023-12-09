import 'dart:ffi';

import 'package:aoc2023/aoc2023.dart';
import '../utils/day_interface.dart';

enum HandRank {
  highCard,
  onePair,
  twoPair,
  threeOfAKind,
  fourOfAKind,
  fiveOfAKind,
  fullHouse,
}

class Card {
  final int value;
  final String suit;

  Card(this.value, this.suit);
}

class Day07 extends AbstractDay {
  Day07() : super(7);

  Map<String, int> highCardToValue = {
    'T': 10,
    'J': 11,
    'Q': 12,
    'K': 13,
    'A': 14
  };

  static const int betMultipier = 5;

  @override
  parseInput() {
    // TODO: implement parseInput
    // throw UnimplementedError();
  }

  @override
  solvePart1() {
    // print(input.asString);

    List<int> bets = [];
    List<int> hands = [];
    List<HandRank> highestCombo = [];

    List<String> games = input.getPerLine();

    RegExp highCardRegExp = RegExp(r'([A-Z])');
    for (final game in games) {
      bets.add(int.parse(game.split(' ')[1]));
      var currentHand = game
          .split(' ')[0]
          .split('')
          .map((e) => e.contains(highCardRegExp) ? highCardToValue[e] : e)
          .where((element) => element != null) // Remove non-numeric elements
          .toList();

      highestCombo.add(getHandRank(currentHand));
      // var currentBet = int.parse(game.split(' '[1]) as String);

      // hands.add(currentHand);
      // print(currentHand);
    }

    print(highestCombo);
    return 'sike';
    // throw UnimplementedError();
  }

  @override
  solvePart2() {
    // TODO: implement solvePart2
    throw UnimplementedError();
  }
}

HandRank getHandRank(List currentHand) {
  bool isFiveOfAKind() {
    for (var i = 0; i <= currentHand.length - 5; i++) {
      if (currentHand[i] == currentHand[i + 4]) {
        return true;
      }
    }
    return false;
  }

  bool isFourOfAKind() {
    for (var i = 0; i <= currentHand.length - 4; i++) {
      if (currentHand[i] == currentHand[i + 3]) {
        return true;
      }
    }
    return false;
  }

  bool isThreeOfAKind() {
    for (var i = 0; i <= currentHand.length - 3; i++) {
      if (currentHand[i] == currentHand[i + 2]) {
        return true;
      }
    }
    return false;
  }

  bool isTwoPair() {
    var pairs = 0;
    for (var i = 0; i < currentHand.length - 1; i++) {
      if (currentHand[i] == currentHand[i + 1]) {
        pairs++;
        i++;
      }
    }
    return pairs == 2;
  }

  bool isOnePair() {
    for (var i = 0; i < currentHand.length - 1; i++) {
      if (currentHand[i] == currentHand[i + 1]) {
        return true;
      }
    }
    return false;
  }

  bool isFullHouse() {
    // Three of a kind + One Pair
    return isThreeOfAKind() && isOnePair();
  }

  if (isFiveOfAKind()) {
    return HandRank.fiveOfAKind;
  }

  if (isFourOfAKind()) {
    return HandRank.fourOfAKind;
  }

  if (isFullHouse()) {
    return HandRank.fullHouse;
  }

  if (isThreeOfAKind()) {
    return HandRank.threeOfAKind;
  }

  if (isTwoPair()) {
    return HandRank.twoPair;
  }

  if (isOnePair()) {
    return HandRank.onePair;
  }

  return HandRank.onePair;
}
