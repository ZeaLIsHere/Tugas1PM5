import 'package:flutter/material.dart';

import '../theme/neo_theme.dart';

class NeoButton extends StatefulWidget {
  const NeoButton({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
    this.color = NeoColors.main,
    this.foregroundColor = NeoColors.mainForeground,
    this.expand = true,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final Color color;
  final Color foregroundColor;
  final bool expand;

  @override
  State<NeoButton> createState() => _NeoButtonState();
}

class _NeoButtonState extends State<NeoButton> {
  bool _pressed = false;

  void _setPressed(bool value) {
    if (_pressed == value || !mounted) {
      return;
    }
    setState(() => _pressed = value);
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      enabled: widget.onPressed != null,
      label: widget.label,
      child: MouseRegion(
        cursor: widget.onPressed == null
            ? SystemMouseCursors.basic
            : SystemMouseCursors.click,
        child: GestureDetector(
          onTap: widget.onPressed,
          onTapDown: (_) => _setPressed(true),
          onTapUp: (_) => _setPressed(false),
          onTapCancel: () => _setPressed(false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 90),
            curve: Curves.easeOut,
            transform: Matrix4.translationValues(
              _pressed ? NeoMetrics.boxShadowX : 0,
              _pressed ? NeoMetrics.boxShadowY : 0,
              0,
            ),
            decoration: BoxDecoration(
              color: widget.color,
              border: neoBorder(),
              borderRadius: BorderRadius.circular(NeoMetrics.radius),
              boxShadow: _pressed ? const <BoxShadow>[] : neoShadow(),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 17),
            child: Row(
              mainAxisSize: widget.expand ? MainAxisSize.max : MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                if (widget.icon != null) ...<Widget>[
                  Icon(widget.icon, size: 20, color: widget.foregroundColor),
                  const SizedBox(width: 10),
                ],
                Flexible(
                  child: Text(
                    widget.label.toUpperCase(),
                    overflow: TextOverflow.ellipsis,
                    style: NeoText.label.copyWith(
                      color: widget.foregroundColor,
                      fontSize: 15,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
