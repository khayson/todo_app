import 'package:flutter/material.dart';

class PageViewBullets extends StatelessWidget {
  final int pageViewItemListLength;
  final int selectedPageIndex;
  final Color primaryColor;

  const PageViewBullets({
    super.key,
    required this.pageViewItemListLength,
    required this.selectedPageIndex,
    required this.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        pageViewItemListLength,
        (index) => Container(
          margin: const EdgeInsets.only(right: 8),
          width: 12,
          height: 12,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: selectedPageIndex == index
                ? primaryColor
                : Colors.grey.withOpacity(.3),
          ),
        ),
      ),
    );
  }
}
