import 'package:flutter/material.dart';
import 'dart:math' show pi;

class AnimationWidget extends StatefulWidget {
  const AnimationWidget({super.key, required this.isPause, required this.setBezier});
  final bool isPause;
  final Function setBezier;

  @override
  State<AnimationWidget> createState() => _AnimationWidgetState();
}

class _AnimationWidgetState extends State<AnimationWidget> with TickerProviderStateMixin {
  late AnimationController rollingController;
  late Animation<double> rollingAnimation;
  late AnimationController stopRollingController;
  late Animation<double> stopRollingAnimation;

  bool tmp = false;

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
      duration: const Duration(milliseconds: 3000),
    );
    stopRollingAnimation = Tween<double>(begin: 130, end: 0).animate(stopRollingController);
  }

  @override
  void didUpdateWidget(covariant AnimationWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isPause) {
      rollingController.stop();
      setState(() {
        tmp = true;
        //widget.setBezier(stopRollingAnimation.value);
      });
      stopRollingController.forward();
    } else {
      rollingController.repeat();
      tmp = false;
    }
    // if (tmp) {
    //   widget.setBezier(stopRollingAnimation.value);
    // }
  }

  @override
  void dispose() {
    rollingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: tmp ? stopRollingController : rollingController,
      builder: (BuildContext context, Widget? widget) {
        return Transform.rotate(
          angle: rollingAnimation.value,
          child: Container(
            color: Colors.grey,
            width: 120,
            height: 120,
          ),
        );
      },
    );
  }
}
