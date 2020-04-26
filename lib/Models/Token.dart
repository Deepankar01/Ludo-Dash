import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:vector_math/vector_math.dart';
import 'Player.dart';

@immutable
class Token extends Equatable {
  final Vector2 location;
  final Player player;
  Token(this.location, this.player);

  @override
  List<Object> get props => [location];
}
