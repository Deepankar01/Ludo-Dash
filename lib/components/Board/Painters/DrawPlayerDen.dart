import 'package:flutter/material.dart';
import 'utils/utils.dart';

class DrawPlayerDen extends CustomPainter {
  final List<Color> denColors;
  DrawPlayerDen({@required this.denColors});
  final strokePaint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2
    ..color = Colors.black
    ..isAntiAlias = true;

  void _drawDen(Canvas canvas, Size squareSize, double boardWidth,
      double boardHeight, double row, double column, Color color) {
    final densSquarePaint = Paint()
      ..style = PaintingStyle.fill
      ..color = color
      ..isAntiAlias = true;
    canvas.drawRect(
        drawRectangle(
          squareSize,
          Offset((squareSize.width * row),
              boardHeight - (boardWidth / 2) + (squareSize.height * column)),
        ),
        densSquarePaint);
    canvas.drawRect(
        drawRectangle(
          squareSize,
          Offset((squareSize.width * row),
              boardHeight - (boardWidth / 2) + (squareSize.height * column)),
        ),
        this.strokePaint);
  }

  void _drawDenTokenPlaceHolders(
      Canvas canvas,
      Size squareSize,
      double boardWidth,
      double boardHeight,
      double row,
      double column,
      Color color) {
    final densCirclePaint = Paint()
      ..style = PaintingStyle.fill
      ..color = color
      ..isAntiAlias = true;
    canvas.drawCircle(
        Offset((squareSize.width * row),
            boardHeight - (boardWidth / 2) + (squareSize.height * column)),
        squareSize.width / 8,
        densCirclePaint);
    canvas.drawCircle(
        Offset((squareSize.width * row),
            boardHeight - (boardWidth / 2) + (squareSize.height * column)),
        squareSize.width / 8,
        this.strokePaint);
  }

  void _drawDenTokenHolders(Canvas canvas, Size squareSize, double boardWidth,
      double boardHeight, double row, double column, Color color) {
    final densSquarePaint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.white
      ..isAntiAlias = true;

    canvas.drawRect(
        drawRectangle(
          squareSize,
          Offset((squareSize.width * row),
              boardHeight - (boardWidth / 2) + (squareSize.height * column)),
        ),
        densSquarePaint);
    canvas.drawRect(
        drawRectangle(
          squareSize,
          Offset((squareSize.width * row),
              boardHeight - (boardWidth / 2) + (squareSize.height * column)),
        ),
        this.strokePaint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    const int numSquaresOneSide = 15;
    final double boardWidth = (size.width);
    final double boardHeight = (size.height / 2);

    final Size squareSize = Size(6 * (boardWidth / numSquaresOneSide),
        6 * (boardWidth / numSquaresOneSide));
    final Size insideSquareSize = Size(4 * (boardWidth / numSquaresOneSide),
        4 * (boardWidth / numSquaresOneSide));

    //DEN 1
    _drawDen(
        canvas, squareSize, boardWidth, boardHeight, 0, 0, this.denColors[0]);
    _drawDenTokenHolders(canvas, insideSquareSize, boardWidth, boardHeight,
        0.25, 0.25, this.denColors[0]);
    _drawDenTokenPlaceHolders(canvas, insideSquareSize, boardWidth, boardHeight,
        0.5, 0.5, this.denColors[0]);
    _drawDenTokenPlaceHolders(canvas, insideSquareSize, boardWidth, boardHeight,
        1, 0.5, this.denColors[0]);
    _drawDenTokenPlaceHolders(canvas, insideSquareSize, boardWidth, boardHeight,
        0.5, 1, this.denColors[0]);
    _drawDenTokenPlaceHolders(canvas, insideSquareSize, boardWidth, boardHeight,
        1, 1, this.denColors[0]);

    //DEN 2
    _drawDen(
        canvas, squareSize, boardWidth, boardHeight, 1.5, 0, this.denColors[1]);
    _drawDenTokenHolders(canvas, insideSquareSize, boardWidth, boardHeight, 2.5,
        0.25, this.denColors[1]);
    _drawDenTokenPlaceHolders(canvas, insideSquareSize, boardWidth, boardHeight,
        2.75, 0.5, this.denColors[1]);
    _drawDenTokenPlaceHolders(canvas, insideSquareSize, boardWidth, boardHeight,
        3.25, 0.5, this.denColors[1]);
    _drawDenTokenPlaceHolders(canvas, insideSquareSize, boardWidth, boardHeight,
        2.75, 1, this.denColors[1]);
    _drawDenTokenPlaceHolders(canvas, insideSquareSize, boardWidth, boardHeight,
        3.25, 1, this.denColors[1]);

    //DEN 3
    _drawDen(
        canvas, squareSize, boardWidth, boardHeight, 0, 1.5, this.denColors[2]);
    _drawDenTokenHolders(canvas, insideSquareSize, boardWidth, boardHeight,
        0.25, 2.5, this.denColors[2]);
    _drawDenTokenPlaceHolders(canvas, insideSquareSize, boardWidth, boardHeight,
        0.5, 2.75, this.denColors[2]);
    _drawDenTokenPlaceHolders(canvas, insideSquareSize, boardWidth, boardHeight,
        1, 2.75, this.denColors[2]);
    _drawDenTokenPlaceHolders(canvas, insideSquareSize, boardWidth, boardHeight,
        1, 3.25, this.denColors[2]);
    _drawDenTokenPlaceHolders(canvas, insideSquareSize, boardWidth, boardHeight,
        0.5, 3.25, this.denColors[2]);

    //  DEN 4
    _drawDen(canvas, squareSize, boardWidth, boardHeight, 1.5, 1.5,
        this.denColors[3]);
    _drawDenTokenHolders(canvas, insideSquareSize, boardWidth, boardHeight, 2.5,
        2.5, this.denColors[3]);
    _drawDenTokenPlaceHolders(canvas, insideSquareSize, boardWidth, boardHeight,
        2.75, 2.75, this.denColors[3]);
    _drawDenTokenPlaceHolders(canvas, insideSquareSize, boardWidth, boardHeight,
        3.25, 2.75, this.denColors[3]);
    _drawDenTokenPlaceHolders(canvas, insideSquareSize, boardWidth, boardHeight,
        3.25, 3.25, this.denColors[3]);
    _drawDenTokenPlaceHolders(canvas, insideSquareSize, boardWidth, boardHeight,
        2.75, 3.25, this.denColors[3]);

    canvas.save();
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
