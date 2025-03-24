import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flappybirdgame/constants.dart';
import 'package:flappybirdgame/game.dart';

class Pipe extends SpriteComponent with CollisionCallbacks,  HasGameRef<FlappyBirdGame>{

  final bool isTopPipe;

  Pipe(Vector2 position,Vector2 size,{required this.isTopPipe})
  : super(position: position, size: size);



  @override
  FutureOr<void> onLoad() {
    sprite = await Sprite.load(isTopPipe ? 'pipe_top.png' : 'pipe_bottom.png');

    add(RectangleHitbox());
  }


  @override
  void update(double dt) {
    position.x -= groundScrollingSpeed * dt;


    if(position.x + size.x <= 0 ){
      removeFromParent();
    }
    
  }

}