import 'package:flutter/material.dart';
import 'utils/utils.dart';

class DrawNonCancelableMarkings extends CustomPainter {
  final List<Color> denColors;
  DrawNonCancelableMarkings({@required this.denColors});

  void _drawHomeEntryMarking(Canvas canvas, int row, int col, Size squareSize,
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

    //den1
    _drawHomeEntryMarking(
      canvas,
      1,
      6,
      squareSize,
      boardHeight,
      boardWidth,
      this.denColors[0],
      strokePaint,
    );
    //den2
    _drawHomeEntryMarking(
      canvas,
      8,
      1,
      squareSize,
      boardHeight,
      boardWidth,
      this.denColors[1],
      strokePaint,
    );
    //den3
    _drawHomeEntryMarking(
      canvas,
      6,
      13,
      squareSize,
      boardHeight,
      boardWidth,
      this.denColors[2],
      strokePaint,
    );
    //den4
    _drawHomeEntryMarking(
      canvas,
      13,
      8,
      squareSize,
      boardHeight,
      boardWidth,
      this.denColors[3],
      strokePaint,
    );

    canvas.save();
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
