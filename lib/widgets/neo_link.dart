import 'package:flutter/material.dart';

import '../theme/neo_theme.dart';

class NeoLink extends StatefulWidget {
  const NeoLink({
    super.key,
    required this.text,
    this.onTap,
    this.color = NeoColors.main,
  });

  final String text;
  final VoidCallback? onTap;
  final Color color;

  @override
  State<NeoLink> createState() => _NeoLinkState();
}

class _NeoLinkState extends State<NeoLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: widget.onTap == null
          ? SystemMouseCursors.basic
          : SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 120),
          curve: Curves.easeOut,
          padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
          decoration: BoxDecoration(
            color: _hovered ? widget.color : Colors.transparent,
            borderRadius: BorderRadius.circular(2),
          ),
          child: Text(
            widget.text,
            style: NeoText.link.copyWith(
              decoration: TextDecoration.underline,
              decorationColor: NeoColors.foreground,
              decorationThickness: _hovered ? 3 : 2,
            ),
          ),
        ),
      ),
    );
  }
}
