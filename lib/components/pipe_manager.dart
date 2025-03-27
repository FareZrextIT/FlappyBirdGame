import 'package:flame/components.dart';
import 'dart:math'; // Dodano za Random()
import '../game.dart';
 // Osiguraj da postoji Pipe klasa

class PipeManager extends Component with HasGameRef<FlappyBirdGame> {
  final double screenHeight;
  final double pipeGap;
  final double minPipeHeight;
  final double maxPipeHeight;

  PipeManager({
    required this.screenHeight,
    required this.pipeGap,
    required this.minPipeHeight,
    required this.maxPipeHeight,
  });

  void spawnPipe() {
    final  = minPipeHeight + Random().nextDouble() * (maxPipeHeight - minPipeHeight);

    // Dodaj logiku za kreiranje cijevi (ako je potrebno)
    // final pipe = Pipe(height: bottomPipeHeight);
    // add(pipe);
  }
}
