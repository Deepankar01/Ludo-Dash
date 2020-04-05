import 'package:flutter/material.dart';

import 'utils/utils.dart';

class DrawHome extends CustomPainter {
  final List<Color> denColors;
  DrawHome({@required this.denColors});
  final strokePaint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2
    ..color = Colors.black
    ..isAntiAlias = true;

  void _drawHome(Canvas canvas, Size squareSize, double boardWidth,
      double boardHeight, double row, double column, Color color) {
    return canvas.drawRect(
        drawRectangle(
          squareSize,
          Offset(boardWidth - boardWidth + (squareSize.width * row),
              boardHeight - (boardWidth / 2) + (squareSize.height * column)),
        ),
        this.strokePaint);
  }

  void _drawHomeTriangle(Canvas canvas, List<Offset> points, Color color) {
    final Path path = Path()..addPolygon(points, true);
    final homeTrianglePaint = Paint()
      ..style = PaintingStyle.fill
      ..color = color
      ..isAntiAlias = true;
    canvas.drawPath(path, homeTrianglePaint);
    canvas.drawPath(path, this.strokePaint);
  }

  List<List<Offset>> _getHomeTriangleCoordinates(
      double boardWidth, double boardHeight, int numSquaresOneSide) {
    final double squareWidth = boardWidth / numSquaresOneSide;
    final double xCenter = boardWidth / 2;
    final double x1 = (xCenter) - 1.5 * (squareWidth);
    final double x2 = (xCenter) + 1.5 * (squareWidth);
    final double y1 = (boardHeight) + 1.5 * (squareWidth);
    final double y2 = (boardHeight) - 1.5 * (squareWidth);
    return [
      [Offset(x1, y1), Offset(xCenter, boardHeight), Offset(x1, y2)],
      [Offset(x1, y2), Offset(xCenter, boardHeight), Offset(x2, y2)],
      [Offset(x2, y1), Offset(xCenter, boardHeight), Offset(x1, y1)],
      [Offset(x2, y2), Offset(xCenter, boardHeight), Offset(x2, y1)],
    ];
  }

  @override
  void paint(Canvas canvas, Size size) {
    const int numSquaresOneSide = 15;
    final double boardWidth = (size.width);
    final double boardHeight = size.height / 2;
    final Size squareSize = Size(3 * (boardWidth / numSquaresOneSide),
        3 * (boardWidth / numSquaresOneSide));

    final List<List<Offset>> triangles =
        _getHomeTriangleCoordinates(boardWidth, boardHeight, numSquaresOneSide);

    triangles.asMap().forEach((int index, List<Offset> coordinate) =>
        _drawHomeTriangle(canvas, coordinate, this.denColors[index]));
    _drawHome(canvas, squareSize, boardWidth, boardHeight, 2, 2, Colors.black);
    canvas.save();
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
