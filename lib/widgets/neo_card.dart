import 'package:flutter/material.dart';

import '../theme/neo_theme.dart';

class NeoCard extends StatelessWidget {
  const NeoCard({
    super.key,
    required this.child,
    this.color = NeoColors.secondaryBackground,
    this.padding = const EdgeInsets.all(28),
    this.radius = NeoMetrics.radius,
    this.shadowColor = NeoColors.border,
    this.shadowOffset = const Offset(
      NeoMetrics.boxShadowX,
      NeoMetrics.boxShadowY,
    ),
    this.borderWidth = NeoMetrics.borderWidth,
    this.width,
  });

  final Widget child;
  final Color color;
  final EdgeInsetsGeometry padding;
  final double radius;
  final Color shadowColor;
  final Offset shadowOffset;
  final double borderWidth;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        border: neoBorder(width: borderWidth),
        borderRadius: BorderRadius.circular(radius),
        boxShadow: neoShadow(
          color: shadowColor,
          dx: shadowOffset.dx,
          dy: shadowOffset.dy,
        ),
      ),
      child: child,
    );
  }
}
