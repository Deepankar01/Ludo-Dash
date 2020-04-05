import 'package:flutter/material.dart';

Rect drawRectangle(Size squareSize, Offset startPoint) {
  Offset endPoint = Offset(
      startPoint.dx + squareSize.width, startPoint.dy + squareSize.height);
  return Rect.fromPoints(startPoint, endPoint);
}
