import 'dart:async';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'components/bird.dart';

class FlappyBirdGame extends FlameGame with TapDetector {

  

/*

Osnovne Komponente Igre
-ptica
-pozadina
-tlo
-cijevi
-rezultat


*/

late Bird bird;

/*

LOAD

*/

@override
  FutureOr<void> onLoad() {
    // ucitaj pticu
    bird = Bird();
    add(bird);
  }

  /*

  TAP

  */

  @override
  void onTap() {
    bird.flop();
  }






  
  
}
