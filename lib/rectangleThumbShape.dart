import 'package:flutter/material.dart';

class RectangleThumbShape extends SliderComponentShape {
  RectangleThumbShape(
    this.thumbRadius,
    this.thumbHeight,
    this.colour,
  );

  final double thumbRadius;
  final thumbHeight;
  final Color colour;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(PaintingContext context, Offset center,
      {Animation<double> activationAnimation,
      Animation<double> enableAnimation,
      bool isDiscrete,
      TextPainter labelPainter,
      RenderBox parentBox,
      SliderThemeData sliderTheme,
      TextDirection textDirection,
      double value,
      double textScaleFactor,
      Size sizeWithOverflow}) {
    final Canvas canvas = context.canvas;

    final rRect = RRect.fromRectAndRadius(
      Rect.fromCenter(
          center: center, width: thumbHeight * .3, height: thumbHeight * 1.0),
      Radius.circular(thumbRadius * .4),
    );

    final paint = Paint()
      ..color = colour //Thumb Background Color
      ..style = PaintingStyle.fill;

    canvas.drawRRect(rRect, paint);

  }
}
