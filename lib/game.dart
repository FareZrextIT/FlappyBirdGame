import 'dart:async';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'components/bird.dart';
import 'components/background.dart';
import 'components/ground.dart';
import 'components/pipe_manager.dart';

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
late PipeManager pipeManager;
late ScoreText scoreText;

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
    
    // ucitaj tlo
    ground = Ground();
    add(ground);
   // ucitaj cijevi
    pipeManager = PipeManager();
    add(pipeManager);

    // ucitaj score
    scoreText = ScoreText();
    add(scoreText);


  }

  /*

  TAP

  */


  @override
  void onTap() {
    bird.flop();

  }

  int score = 0;

  void incrementScore(){
    score += 1;
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
        content: Text("High Score: $score"),
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
    score = 0;
    isGameOver = false;
    children.whereType<Pipe>().forEach(action: (Object? pipe)=> pipe.removeFromParent());
    resumeEngine();
  }






  
  
}
