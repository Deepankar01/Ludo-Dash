import 'package:flutter/material.dart';
import 'utils/utils.dart';

class DrawMovesBoard extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const int numSquaresOneSide = 15;
    final double boardWidth = (size.width);
    final double boardHeight = (size.height / 2);

    final Size squareSize =
        Size((boardWidth / numSquaresOneSide), boardWidth / numSquaresOneSide);

    final movesSquarePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..color = Colors.black
      ..isAntiAlias = true;

    for (int col = 0; col < numSquaresOneSide; col++) {
      for (int row = 0; row < numSquaresOneSide; row++) {
        canvas.drawRect(
            drawRectangle(
              squareSize,
              Offset(squareSize.width * row,
                  boardHeight - (boardWidth / 2) + (squareSize.height * col)),
            ),
            movesSquarePaint);
      }
    }
    canvas.save();
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
