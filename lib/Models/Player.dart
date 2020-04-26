import 'dart:ui';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

@immutable
class Player extends Equatable {
  final Color tokenColor;
  Player(this.tokenColor);

  @override
  List<Object> get props => [this.tokenColor];
}
