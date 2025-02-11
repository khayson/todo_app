import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final Color color;
  final VoidCallback onBackPressed;
  final VoidCallback onForwardPressed;
  final bool isFirstPage;

  const ActionButton({
    super.key,
    required this.color,
    required this.onBackPressed,
    required this.onForwardPressed,
    this.isFirstPage = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (!isFirstPage)
          GestureDetector(
            onTap: onBackPressed,
            child: Container(
              width: 56,
              height: 56,
              margin: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                Icons.arrow_back_rounded,
                color: color,
              ),
            ),
          ),
        GestureDetector(
          onTap: onForwardPressed,
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
        ),
      ],
    );
  }
}
