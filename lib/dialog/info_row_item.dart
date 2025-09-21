import 'package:flutter/material.dart';

class InfoRowItem {
  final String title;
  final String value;
  final IconData? icon;
  final Color? iconColor;

  InfoRowItem({
    required this.title,
    required this.value,
    this.icon,
    this.iconColor,
  });
}
