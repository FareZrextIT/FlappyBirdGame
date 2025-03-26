import 'package:flame/components.dart';
import 'package:flappybirdgame/game.dart';

class PipeManager extends Component with HasGameRef<FlappyBirdGame>{

  double pipeSpawnTimer = 0;

  @override
  void update(double dt) {
    
    pipeSpawnTimer += dt;
    const double pipeInterval = 2;

    if(pipeSpawnTimer > pipeInterval ){
      pipeSpawnTimer = 0;
      spawnPipe();

    }
  }

  void spawnPipe() {
    final double screenHeight = gameRef.size.y;
    


    final double maxPipeHeight =
        screenHeight - groundHeight - pipeGap - minPipeHeight;

    final double bottomPipeHeight = minPipeHeight + Random().nextDouble() * (maxPipeHeight - minPipeHeight);

  // height of top pipe
  final double topPipeHeight =
      screenHeight - groundHeight - bottomPipeHeight - pipeGap;

      final bottomPipe = Pipe{
        Vector2(gameRef.size.x, screenHeight - groundHeight - bottomPipeHeight),
        Vector2(pipeWidth,bottomPipeHeight),
        isTopPipe: false,
      };

      final topPipe = Pipe(
        Vector2(gameRef.size.x,0), 
        Vector2(pipeWidth,topPipeHeight),
        isTopPipe: true,
        );

        gameRef.add(bottomPipe);
        gameRef.add(topPipe);


  }
}