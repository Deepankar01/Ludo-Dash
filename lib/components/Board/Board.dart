import 'package:flutter/material.dart';
import 'Painters/DrawNonCancelableMarkings.dart';
import 'Painters/DrawHome.dart';
import 'Painters/DrawBoard.dart';
import 'Painters/DrawHomePath.dart';
import 'Painters/DrawMovesBoard.dart';
import 'Painters/DrawPlayerDen.dart';

class Board extends StatelessWidget {
  final List<Color> playerDenColours = [
    Colors.green,
    Colors.yellow,
    Colors.redAccent,
    Colors.indigo,
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: CustomPaint(
        painter: DrawBoard(),
        child: CustomPaint(
          painter: DrawMovesBoard(),
          child: CustomPaint(
            painter: DrawPlayerDen(denColors: playerDenColours),
            child: CustomPaint(
              painter: DrawHome(denColors: playerDenColours),
              child: CustomPaint(
                painter: DrawHomePath(denColors: playerDenColours),
                child: CustomPaint(
                  painter:
                      DrawNonCancelableMarkings(denColors: playerDenColours),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
