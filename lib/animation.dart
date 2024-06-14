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
      duration: const Duration(milliseconds: 3000),
    );
    rollingAnimation = Tween<double>(begin: 0.0, end: pi * 2).animate(rollingController);

    stopRollingController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );
    stopRollingCurve = CurvedAnimation(parent: stopRollingController, curve: Curves.ease);
    stopRollingAnimation = Tween<double>(begin: 120, end: 0).animate(stopRollingCurve);
  }

  @override
  void dispose() {
    rollingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: isPause ? stopRollingController : rollingController,
      builder: (BuildContext context, Widget? widget) {
        return Container(
          width: MediaQuery.of(context).size.width * 1,
          height: MediaQuery.of(context).size.height * 1,
          color: Colors.lightBlue.shade50,
          child: Stack(
            children: [
              Column(
                children: [
                  // Expanded(
                  //   child: Container(
                  //     height: 500,
                  //     color: Colors.blueGrey,
                  //   ),
                  // ),
                  Expanded(
                    child: CustomPaint(
                      painter: MyPainter(bezier: stopRollingAnimation.value),
                    ),
                  ),
                ],
              ),
              TextButton(
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
                  width: 100,
                  height: 100,
                  color: Colors.red,
                ),
              ),
              Positioned(
                left: 140,
                top: 540,
                child: Align(
                  alignment: Alignment.center,
                  child: Transform.rotate(
                    angle: rollingAnimation.value,
                    child: Container(
                      color: Colors.grey,
                      width: 120,
                      height: 120,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
