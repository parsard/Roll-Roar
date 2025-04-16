import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Dice extends StatelessWidget {
  final int diceNumber;
  const Dice({super.key, required this.diceNumber});
  @override
  Widget build(BuildContext context) {
    // Dice label mapping: 1=>'one', 2=>'two', ...
    final names = ['one', 'two', 'three', 'four', 'five', 'six'];
    final diceName = names[diceNumber - 1];

    final dicePath = 'assets/images/dice/dice-six-faces-$diceName.svg';
    return SvgPicture.asset(dicePath, width: 200, height: 200);
  }
}
