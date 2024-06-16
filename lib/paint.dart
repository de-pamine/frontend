import 'package:flutter/material.dart';

class MyPainter extends CustomPainter {
  const MyPainter({required this.bezier});
  final double bezier;
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 3
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    final path1 = Path()
      ..moveTo(0, 500 + 50)
      ..quadraticBezierTo(
        200,
        500 + 50 + (110 * bezier / 120),
        411,
        500 + 50 + (150 * bezier / 120),
      );

    final path2 = Path()
      ..addPath(
        path1,
        const Offset(0, 0),
      )
      ..lineTo(411, 0)
      ..lineTo(0, 0)
      ..lineTo(0, 500 + 180);

    canvas.drawPath(path2, paint);

    // final paint2 = Paint()
    //   ..color = Colors.grey
    //   ..style = PaintingStyle.fill;
    // canvas.drawRect(
    //   Rect.fromCenter(
    //     center: const Offset(200, 500 + 100),
    //     width: 120,
    //     height: 120,
    //   ),
    //   paint2,
    // );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

      // (
      //   240,
      //   500 + 50 + bezier,
      //   411,
      //   500 + 50 + bezier + 20,
      // )
      
      //..moveTo(0, 500 + 50 + (150 * (120 - bezier) / 120))
      //..quadraticBezierTo(
      //  200,
      //  500 + 50 + (-40 * bezier / 120) + 150,
      //  411,
      //  500 + 50 + 150,