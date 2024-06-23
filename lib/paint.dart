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

    final paint2 = Paint()
      ..strokeWidth = 3
      ..color = Colors.lightBlue.shade50
      ..style = PaintingStyle.fill
      ..maskFilter = const MaskFilter.blur(BlurStyle.solid, 20);

    final path1 = Path()
      ..moveTo(0, 500 + 50 + (110 * (120 - bezier) / 120))
      ..quadraticBezierTo(
        200,
        500 + 50 + 110,
        411,
        500 + 50 + (bezier / 3) + 110,
      );

    final path2 = Path()
      ..addPath(
        path1,
        const Offset(0, 0),
      )
      ..lineTo(411, 0)
      ..lineTo(0, 0)
      ..lineTo(0, 500 + 180);

    final path3 = Path()
      ..addPath(
        path1,
        const Offset(0, 0),
      )
      ..lineTo(411, 866)
      ..lineTo(0, 866)
      ..lineTo(0, 500 + 180);

    canvas.drawPath(path2, paint);

    canvas.drawPath(path3, paint2);

    //canvas.save();
    //canvas.translate(2.5, 2.5);
    //canvas.drawShadow(path1, Colors.black, 10, false);
    //canvas.restore();
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

      // ..moveTo(0, 500 + 50)
      // ..quadraticBezierTo(
      //   200,
      //   500 + 50 + (110 * bezier / 120),
      //   411,
      //   500 + 50 + (150 * bezier / 120),
      // );