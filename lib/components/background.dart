import 'package:flame/components.dart';


import 'dart:async';

class Background extends SpriteComponent {
  Background({required Vector2 size}) : super(size: size, position: Vector2.zero());

  @override
  FutureOr<void> onLoad() async {
    sprite = await Sprite.load('background.png');
  }
}

