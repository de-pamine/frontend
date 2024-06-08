import 'package:flutter/material.dart';

class AnimationWidget extends StatefulWidget {
  const AnimationWidget({super.key});

  @override
  State<AnimationWidget> createState() => _AnimationWidgetState();
}

class _AnimationWidgetState extends State<AnimationWidget> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double oldAngle = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 4000),
      value: 0.0,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, Widget? widget) {
        //print(_controller.value);
        //print(oldAngle);
        oldAngle += 0.1;
        print(_controller.value);
        //_controller.value = oldAngle;
        return GestureDetector(
          onTap: () {
            _controller.repeat();
          },
          child: Transform.rotate(
            angle: oldAngle,
            child: Container(
              color: Colors.grey,
              width: 120,
              height: 120,
            ),
          ),
        );
      },
    );
  }
}
