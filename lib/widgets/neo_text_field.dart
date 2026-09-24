import 'package:flutter/material.dart';

import '../theme/neo_theme.dart';

class NeoTextField extends StatefulWidget {
  const NeoTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.controller,
    this.keyboardType,
    this.textInputAction,
    this.obscureText = false,
    this.prefixIcon,
    this.autofillHints,
  });

  final String label;
  final String hintText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final IconData? prefixIcon;
  final Iterable<String>? autofillHints;

  @override
  State<NeoTextField> createState() => _NeoTextFieldState();
}

class _NeoTextFieldState extends State<NeoTextField> {
  final FocusNode _focusNode = FocusNode();
  late bool _obscure = widget.obscureText;
  bool _focused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    _focusNode
      ..removeListener(_handleFocusChange)
      ..dispose();
    super.dispose();
  }

  void _handleFocusChange() {
    if (_focused == _focusNode.hasFocus) {
      return;
    }
    setState(() => _focused = _focusNode.hasFocus);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(widget.label.toUpperCase(), style: NeoText.label),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: _focusNode.requestFocus,
          child: MouseRegion(
            cursor: SystemMouseCursors.text,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 120),
              curve: Curves.easeOut,
              decoration: BoxDecoration(
                color: NeoColors.secondaryBackground,
                border: neoBorder(),
                borderRadius: BorderRadius.circular(NeoMetrics.radius),
                boxShadow: neoShadow(
                  color: _focused ? NeoColors.main : NeoColors.border,
                ),
              ),
              child: Row(
                children: <Widget>[
                  if (widget.prefixIcon != null)
                    Padding(
                      padding: const EdgeInsets.only(left: 14),
                      child: Icon(
                        widget.prefixIcon,
                        size: 20,
                        color: NeoColors.foreground,
                      ),
                    ),
                  Expanded(
                    child: TextField(
                      controller: widget.controller,
                      focusNode: _focusNode,
                      keyboardType: widget.keyboardType,
                      textInputAction: widget.textInputAction,
                      obscureText: _obscure,
                      obscuringCharacter: '•',
                      autofillHints: widget.autofillHints,
                      cursorColor: NeoColors.foreground,
                      cursorWidth: 2.5,
                      style: NeoText.body,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: widget.hintText,
                        hintStyle: NeoText.body.copyWith(
                          color: NeoColors.foreground.withValues(alpha: 0.35),
                          fontWeight: FontWeight.w400,
                        ),
                        contentPadding: EdgeInsets.only(
                          left: widget.prefixIcon == null ? 16 : 12,
                          right: widget.obscureText ? 4 : 16,
                          top: 17,
                          bottom: 17,
                        ),
                      ),
                    ),
                  ),
                  if (widget.obscureText) _buildVisibilityToggle(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildVisibilityToggle() {
    return GestureDetector(
      onTap: () => setState(() => _obscure = !_obscure),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
          child: Icon(
            _obscure
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            size: 20,
            color: NeoColors.foreground,
          ),
        ),
      ),
    );
  }
}
