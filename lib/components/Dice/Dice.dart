import 'dart:math';
import 'package:flutter/widgets.dart';
import './DiceFace.dart';

class Dice extends StatefulWidget {
  final Size size;
  Dice(this.size);

  @override
  _DiceState createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  int currentNumber = 1;
  Random rnd = Random();

  @override
  void initState() {
    super.initState();
  }

  __change() {
    int probableNumber;
    do {
      probableNumber = rnd.nextInt(7);
    } while (probableNumber == 0);

    this.setState(() {
      currentNumber = probableNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: __change,
      child: DiceFace(
        display: this.currentNumber,
        size: this.widget.size,
      ),
    );
  }
}
