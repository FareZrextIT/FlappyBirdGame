import 'package:flame/components.dart';
import 'package:flappybirdgame/game.dart';

class PipeManager extends Component with HasGameRef<FlappyBirdGame>{

  double pipeSpawnTimer = 0;

  @override
  void update(double dt) {
    
    pipeSpawnTimer += dt;
    const double pipeInterval = 50;

    if(pipeSpawnTimer > pipeInterval ){
      pipeSpawnTimer = 0;
      spawnPipe();

    }
  }

  void spawnPipe() {
    final double screenHeight = gameRef.size.y;
    const double pipeGap = 150;
    const double minPipeHeight = 50;
    const double pipeWidth = 60;


    final double maxPipeHeight =
        screenHeight - groundHeight - pipeGap - minPipeHeight;

    final double bottomPipeHeight = minPipeHeight + Random().nextDouble() * (maxPipeHeight - minPipeHeight);

  // height of top pipe
  final double topPipeHeight =
      screenHeight - groundHeight - bottomPipeHeight - pipeGap;

      final bottomPipe = Pipe{
        Vector2
        size,
        isTopPipe: isTopPipe,
      };
  }
}