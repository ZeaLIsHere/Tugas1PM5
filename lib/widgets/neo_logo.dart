import 'package:flutter/material.dart';

import '../theme/neo_theme.dart';
import 'neo_card.dart';

class NeoLogo extends StatelessWidget {
  const NeoLogo({
    super.key,
    this.size = 48,
    this.color = NeoColors.secondaryBackground,
    this.icon = Icons.bolt,
    this.iconColor = NeoColors.foreground,
  });

  final double size;
  final Color color;
  final IconData icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: NeoCard(
        color: color,
        padding: EdgeInsets.zero,
        radius: 6,
        child: Center(
          child: Icon(icon, size: size * 0.5, color: iconColor),
        ),
      ),
    );
  }
}
