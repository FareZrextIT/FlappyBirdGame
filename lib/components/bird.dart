import 'dart:async';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flappybirdgame/constants.dart';
import 'package:flappybirdgame/components/ground.dart';  // Import Ground if defined elsewhere
import 'package:flappybirdgame/components/pipe.dart';

class FlappyBirdGame  {
  void gameOver() {
    // Your game over logic here
    ("Game Over!");
  }
}    // Import Pipe if defined elsewhere

class Bird extends SpriteComponent with CollisionCallbacks {
  Bird() : super(position: Vector2(birdStartX, birdStartY), size: Vector2(60, 40));

  double velocity = 0;




  @override
  FutureOr<void> onLoad() async {
    sprite = await Sprite.load('bird.png');
    add(RectangleHitbox());
  }

  void flop() {
    velocity = jumpStrength;
  }

  @override
  void update(double dt) {
    velocity += gravity * dt;
    position.y += velocity * dt;
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);

    // Ensure Ground and Pipe are defined or imported correctly
    if (other is Ground) {
      (parent as FlappyBirdGame).gameOver();
    }

    if (other is Pipe) {
      (parent as FlappyBirdGame).gameOver();
    }
  }
}
