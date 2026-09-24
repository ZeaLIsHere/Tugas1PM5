import 'package:flutter/material.dart';

import '../theme/neo_theme.dart';

class NeoPageShell extends StatelessWidget {
  const NeoPageShell({super.key, required this.child, this.maxWidth = 460});

  final Widget child;
  final double maxWidth;

  static const double _padding = 24;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final double minHeight =
                constraints.maxHeight.isFinite &&
                    constraints.maxHeight > _padding * 2
                ? constraints.maxHeight - _padding * 2
                : 0;

            return SingleChildScrollView(
              padding: const EdgeInsets.all(_padding),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: minHeight),
                child: Center(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: maxWidth),
                    child: child,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class NeoSwatches extends StatelessWidget {
  const NeoSwatches({super.key});

  static const List<Color> _colors = <Color>[
    NeoColors.secondaryBackground,
    NeoColors.chart3,
    NeoColors.chart4,
    NeoColors.chart5,
    NeoColors.chart2,
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: <Widget>[
        for (final Color color in _colors)
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: color,
              border: neoBorder(width: 2.5),
              borderRadius: BorderRadius.circular(4),
              boxShadow: neoShadow(dx: 3, dy: 3),
            ),
          ),
      ],
    );
  }
}
