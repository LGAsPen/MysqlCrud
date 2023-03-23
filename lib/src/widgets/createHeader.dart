// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';

class HeaderAppBar extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final lapiz = Paint();

    lapiz.color = const Color.fromARGB(255, 255, 150, 2);
    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 20;
    final path = Path();

    path.lineTo(0, size.height * 0.26);
    path.quadraticBezierTo(size.width * 0.01, size.height * 0.29,
        size.width * 0.2, size.height * 0.29);
    path.quadraticBezierTo(size.width * 0.20, size.height * 0.29,
        size.width * 0.80, size.height * 0.29);
    path.quadraticBezierTo(
        size.width * 0.98, size.height * 0.29, size.width, size.height * 0.34);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, lapiz);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
