import 'dart:async';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flappybirdgame/constants.dart';
import 'package:flappybirdgame/game.dart';
import 'components/ground.dart';

class Bird extends SpriteComponent with CollisionCallbacks{

  /*

  INIT BIRD

  */

  // inicijaliziranje pticine pozicije i velicine
  Bird() : super(position: Vector2(birdStartX, birdStartY),size: Vector2(60, 40));

  double velocity = 0;
 

  /*

  LOAD

  */

  @override
  FutureOr<void> onLoad() async {
    // ucitaj pticinu sprite sliku
    sprite = await Sprite.load('bird.png');

    add(RectangleHitbox());
  }

  /*

  JUMP / FLAP

  */
  void flop() {
    velocity = jumpStrength;
  }

  /*

  UPDATE -> every second

  */

  @override
  void update(double dt) {
    // pristup gravitaciji
    velocity += gravity * dt;
    // updateovanje pozicije na trenutni velocity
    position.y += velocity * dt;


  }
  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);

    if (other is Ground){
      (parent as FlappyBirdGame).gameOver();
    }
  }

  
  }


