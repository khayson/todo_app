import 'package:flutter/material.dart';

class PageItem {
  final String id;
  final String title;
  final String subtitle;
  final String assetImage;
  final Color primaryColor;

  const PageItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.assetImage,
    required this.primaryColor,
  });
}
