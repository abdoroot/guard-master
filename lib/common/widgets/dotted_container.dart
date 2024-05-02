import 'package:flutter/material.dart';
import 'package:guard_master/common/resources/app_color.dart';

class DottedBorderWidget extends StatelessWidget {
  DottedBorderWidget(
      {Key? key,
      required this.child,
      this.padding,
      this.width,
      this.height,
      this.thickness = 5,
      this.dashColor,
      this.dashSpace,
      this.dashWidth = 5,
      this.borderRadius})
      : super(
          key: key,
        );
  final Widget child;
  final EdgeInsets? padding;
  final double? width, height, thickness, dashSpace, dashWidth;
  final Color? dashColor;
  final BorderRadius? borderRadius;
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        painter: DashedBorderPainter(
            color: dashColor ?? AppColors.struckColor,
            dashWidth: dashWidth! < 5 ? dashWidth! + 5 : dashWidth!,
            thickness: 1,
            dashSpace: dashSpace ?? 3.0,
            borderRadius: borderRadius ?? BorderRadius.circular(0)),
        child: Padding(
          padding: padding ?? const EdgeInsets.all(8.0),
          child: child,
        ));
  }
}

class DashedBorderPainter extends CustomPainter {
  final BorderRadius borderRadius;
  final double thickness, dashWidth, dashSpace;
  final Color color;
  DashedBorderPainter({
    required this.thickness,
    required this.dashSpace,
    required this.dashWidth,
    required this.color,
    required this.borderRadius,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = thickness
      ..style = PaintingStyle.stroke;

    final Path path = Path();

    // Create the outer rounded rectangle
    final Rect rect =
        Rect.fromPoints(Offset(0, 0), Offset(size.width, size.height));
    final RRect roundedRect = RRect.fromRectAndCorners(
      rect,
      topLeft: borderRadius.topLeft,
      topRight: borderRadius.topRight,
      bottomLeft: borderRadius.bottomLeft,
      bottomRight: borderRadius.bottomRight,
    );

    // Add the rounded rectangle path to the main path
    path.addRRect(roundedRect);

    // Calculate the dash spacing based on the total length of the path
    final double totalLength = path.computeMetrics().single.length;
    final int dashCount = (totalLength / (dashWidth + dashSpace)).floor();

    // Draw the dashed border
    for (int i = 0; i < dashCount; i++) {
      final double start = (dashWidth + dashSpace) * i;
      final double end = start + dashWidth;
      canvas.drawLine(
        pathMetricPoint(path, start),
        pathMetricPoint(path, end),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }

  // Helper function to get a point on the path at a specific distance
  Offset pathMetricPoint(Path path, double distance) {
    final metrics = path.computeMetrics();
    for (final metric in metrics) {
      if (metric.length >= distance) {
        final offset = metric.getTangentForOffset(distance)!.position;
        return offset;
      }
    }
    return Offset.zero;
  }
}
