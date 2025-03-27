
import 'package:flame/text.dart';
import 'package:flutter/material.dart';
import '../game.dart';
import 'package:flame/components.dart';

class ScoreText extends TextComponent with HasGameRef<FlappyBirdGame> {
  ScoreText() : super(
    text: '0',
    textRenderer: TextPaint(
      style: const TextStyle(
        color: Colors.black87, // Promijenjena nijansa na sigurniju
        fontSize: 48,
      ),
    ),
  );

  @override
  Future<void> onLoad() async {
    await super.onLoad(); // Poziv nadklasne metode

    size = Vector2(100, 50); // Osigurava da `size` nije null

    position = Vector2(
      (gameRef.size.x - size.x) / 2,
      gameRef.size.y - size.y - 50,
    );
  }

  @override
  void update(double dt) {
    super.update(dt); // Poziv nadklas
  
  final newText = gameRef.scoreText.toString();
    if (text != newText) {
      text = newText;
    }
  }
}