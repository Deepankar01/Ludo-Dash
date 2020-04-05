import 'package:flutter/material.dart';
import 'utils/utils.dart';

class DrawHomePath extends CustomPainter {
  final List<Color> denColors;
  DrawHomePath({@required this.denColors});

  void _drawHomePath(Canvas canvas, int row, int col, Size squareSize,
      double boardHeight, double boardWidth, Color color, Paint strokePaint) {
    final homepathPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = color
      ..isAntiAlias = true;

    canvas.drawRect(
        drawRectangle(
          squareSize,
          Offset(squareSize.width * row,
              boardHeight - (boardWidth / 2) + (squareSize.height * col)),
        ),
        homepathPaint);
    canvas.drawRect(
        drawRectangle(
          squareSize,
          Offset(squareSize.width * row,
              boardHeight - (boardWidth / 2) + (squareSize.height * col)),
        ),
        strokePaint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    const int numSquaresOneSide = 15;
    final double boardWidth = (size.width);
    final double boardHeight = (size.height / 2);

    final Size squareSize =
        Size((boardWidth / numSquaresOneSide), boardWidth / numSquaresOneSide);

    final strokePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..color = Colors.black
      ..isAntiAlias = true;

    //den1,3
    for (int row = 1; row < numSquaresOneSide - 1; row++) {
      if (row < 6) {
        _drawHomePath(
          canvas,
          row,
          7,
          squareSize,
          boardHeight,
          boardWidth,
          this.denColors[0],
          strokePaint,
        );
      } else if (row > 8) {
        _drawHomePath(
          canvas,
          row,
          7,
          squareSize,
          boardHeight,
          boardWidth,
          this.denColors[3],
          strokePaint,
        );
      }
    }

    //den 2,4
    for (int col = 1; col < numSquaresOneSide - 1; col++) {
      if (col < 6) {
        _drawHomePath(
          canvas,
          7,
          col,
          squareSize,
          boardHeight,
          boardWidth,
          this.denColors[1],
          strokePaint,
        );
      } else if (col > 8) {
        _drawHomePath(
          canvas,
          7,
          col,
          squareSize,
          boardHeight,
          boardWidth,
          this.denColors[2],
          strokePaint,
        );
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
