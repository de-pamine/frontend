import 'package:depamine/paint.dart';
import 'package:flutter/material.dart';
import 'dart:math' show pi;

class AnimationWidget extends StatefulWidget {
  const AnimationWidget({super.key});

  @override
  State<AnimationWidget> createState() => _AnimationWidgetState();
}

class _AnimationWidgetState extends State<AnimationWidget> with TickerProviderStateMixin {
  late AnimationController rollingController;
  late Animation<double> rollingAnimation;
  late AnimationController stopRollingController;
  late Animation<double> stopRollingAnimation;
  late Animation<double> stopRollingCurve;

  bool isPause = true;

  @override
  void initState() {
    super.initState();
    rollingController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    rollingAnimation = Tween<double>(begin: 0.0, end: pi * 2).animate(rollingController);

    stopRollingController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    stopRollingCurve = CurvedAnimation(parent: stopRollingController, curve: Curves.decelerate);
    stopRollingAnimation = Tween<double>(begin: 120, end: 0).animate(stopRollingCurve);
  }

  @override
  void dispose() {
    rollingController.dispose();
    stopRollingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: isPause ? stopRollingController : rollingController,
      builder: (BuildContext context, Widget? widget) {
        return Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: CustomPaint(
                    painter: MyPainter(bezier: stopRollingAnimation.value),
                  ),
                ),
              ],
            ),
            Positioned(
              left: 340,
              top: 800,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    isPause = !isPause;
                    if (isPause) {
                      rollingController.stop();
                      stopRollingController.forward();
                    } else {
                      rollingController.repeat();
                    }
                  });
                },
                child: Container(
                  width: 50,
                  height: 50,
                  color: Colors.red,
                ),
              ),
            ),
            Positioned(
              left: 140,
              top: 600, //540
              child: Transform.rotate(
                angle: isPause ? getAngle() : rollingAnimation.value,
                child: Container(
                  color: Colors.grey,
                  width: 120,
                  height: 120,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  double getAngle() {
    final oldValue = rollingAnimation.value;
    final newValue = oldValue > pi ? 4 * pi - oldValue : 2 * pi - oldValue;
    newValue;
    return oldValue + (120 - stopRollingAnimation.value) * newValue / 120;
  }
}
