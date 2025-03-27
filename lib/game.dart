import 'package:flame/game.dart';
import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'components/pipe_manager.dart';
import 'components/score.dart';
import 'components/bird.dart'; // Import Bird klase

class FlappyBirdGame extends FlameGame with TapDetector, HasCollisionDetection {
  late ScoreText scoreText;
  late double screenHeight;
  late double pipeGap;
  late double minPipeHeight;
  late double maxPipeHeight;
  late double birdStartX;
  late double birdStartY;

  late Bird _bird; // Privatna instanca ptice
  int score = 0;

  // Konstruktor za inicijalizaciju varijabli
  FlappyBirdGame() {
    screenHeight = 800;
    pipeGap = 100;
    minPipeHeight = 50;
    maxPipeHeight = 300;
    birdStartX = 100;
    birdStartY = 200;
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();

    // Inicijalizacija ptice
    _bird = Bird(position: Vector2(birdStartX, birdStartY));
    add(_bird);

    // Inicijalizacija ScoreText
    scoreText = ScoreText();
    add(scoreText);

    // Inicijalizacija PipeManager
    final pipeManager = PipeManager(
      screenHeight: screenHeight,
      pipeGap: pipeGap,
      minPipeHeight: minPipeHeight,
      maxPipeHeight: maxPipeHeight,
    );
    add(pipeManager);
  }

  // Getter za bird kako bi bio dostupan u Pipe klasi
  Bird get bird => _bird;

  // Funkcija za povećanje rezultata
  void incrementScore() {
    score += 1;
    scoreText.updateScore(score); // Ažuriraj prikaz skor teksta
    print("Score: $score");
  }
}