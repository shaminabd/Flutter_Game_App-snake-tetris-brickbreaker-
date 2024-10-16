import 'dart:async';

import 'package:flutter_application_1/brickhead/src/config.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

import '../brick_breaker.dart';

class PlayArea extends RectangleComponent with HasGameReference<BrickBreaker>{
  PlayArea()
    : super(
      paint: Paint()..color = const Color.fromARGB(255, 2, 2, 2),
      children: [RectangleHitbox()],
    );
  @override
  FutureOr<void> onLoad() async{
    super.onLoad();
    size = Vector2(game.width, gameHeight);
  }
}