import 'dart:async';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flappybirdgame/constants.dart';
import 'package:flappybirdgame/game.dart';

class Pipe extends SpriteComponent with CollisionCallbacks, HasGameRef<FlappyBirdGame> {
  final bool isTopPipe;
  bool scored = false;

  // Constructor: Accepts position, size, and a flag for top/bottom pipe
  Pipe(Vector2 position, Vector2 size, {required this.isTopPipe})
      : super(position: position, size: size);

  @override
  FutureOr<void> onLoad() async {
    // Load sprite based on whether it's a top or bottom pipe
    sprite = await Sprite.load(isTopPipe ? 'pipe_top.png' : 'pipe_bottom.png');

    // Add a hitbox for collision detection
    add(RectangleHitbox());
  }

  @override
  void update(double dt) {
    // Move the pipe left (simulate scrolling)
    position.x -= groundScrollingSpeed * dt;

    // Check if the bird passed the pipe and score if the pipe is top
    if (!scored && position.x + size.x < gameRef.bird.position.x) {
      scored = true;
      if (isTopPipe) {
        gameRef.incrementScore();  // Increment score if it's the top pipe
      }
    }

    // Remove the pipe if it's off-screen
    if (position.x + size.x <= 0) {
      removeFromParent();
    }
  }
}