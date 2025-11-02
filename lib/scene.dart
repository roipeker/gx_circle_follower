import 'package:flutter/material.dart';
import 'package:graphx/graphx.dart';

class MyScene extends GSprite {
  late GShape ball;
  static const double ballRadius = 20.0;
  static const Color ballColor = Color(0xFF00D4FF);

  @override
  void addedToStage() {
    stage!.color = Colors.black;
    super.addedToStage();
    _createBall();
    _setupMouseTracking();
  }

  void _createBall() {
    ball = GShape();
    addChild(ball);
    ball.graphics.beginFill(ballColor).drawCircle(0, 0, ballRadius).endFill();
  }

  double tx = 0;
  double ty = 0;
  double breathingTime = 0.0;
  static const double breathingSpeed = 8;
  static const double breathingMinScale = 0.85;
  static const double breathingMaxScale = 1.25;

  void _setupMouseTracking() {
    stage!.onMouseMove.add((MouseInputData input) {
      tx = input.stageX;
      ty = input.stageY;
    });
  }

  @override
  void update(double dt) {
    super.update(dt);
    ball.x += (tx - ball.x) / 20;
    ball.y += (ty - ball.y) / 20;
    breathingTime += dt * breathingSpeed;
    final double breathingValue = (Math.sin(breathingTime) + 1.0) / 2.0;
    final double scale =
        breathingMinScale +
        (breathingMaxScale - breathingMinScale) * breathingValue;
    ball.scale = scale;
  }
}
