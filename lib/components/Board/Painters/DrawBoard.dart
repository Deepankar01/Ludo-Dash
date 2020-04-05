import 'package:flutter/material.dart';

class DrawBoard extends CustomPainter {
  Rect _getMainBoard(double width, double height) {
    Offset center = Offset(width / 2, height / 2);
    return Rect.fromCircle(center: center, radius: width / 2);
  }

  @override
  void paint(Canvas canvas, Size size) {
    final mainBoardPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.white
      ..isAntiAlias = true;
    print(size);
    canvas.drawRect(_getMainBoard(size.width, size.height), mainBoardPaint);
    canvas.save();
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
