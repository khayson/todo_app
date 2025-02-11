import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final Color color;
  final VoidCallback onPressed;

  const ActionButton({
    super.key,
    required this.color,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: const Icon(
          Icons.arrow_forward_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}
