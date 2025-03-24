import 'dart:async';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'components/bird.dart';
import 'components/background.dart';
import 'components/ground.dart';


class FlappyBirdGame extends FlameGame with TapDetector,HasCollisionDetection {

  

/*

Osnovne Komponente Igre
-ptica
-pozadina
-tlo
-cijevi
-rezultat


*/

late Bird bird;
late Background background;
late Ground ground;

/*

LOAD

*/

@override
  FutureOr<void> onLoad() {
    
    
    // ucitaj pozadinu
    background = Background(size);
    add(background);

    // ucitaj pticu
    bird = Bird();
    add(bird);

    ground = Ground();
    add(ground);
  }

  /*

  TAP

  */


  @override
  void onTap() {
    bird.flop();

  }



  bool isGameOver = false;

  void gameOver() {
    if(isGameOver) return;

    isGameOver = true;
    pauseEngine();

    showDialog(
      context: buildContext,
       builder: (context) => AlertDialog(
        title: const Text("Game Over"),
        actions: [
          TextButton(
            onPressed: (){
              Navigator.pop(context);

              resetGame();
            },

          )
        ],
       )
    );

  }
  void resetGame(){
    bird.position = Vector2(birdStartX, birdStartY);
    bird.velocity = 0;
    isGameOver = false;
    resumeEngine();
  }






  
  
}
