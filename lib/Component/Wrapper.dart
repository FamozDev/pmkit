import 'package:flutter/material.dart';

Widget HoverWrapped(void Function(bool) isHovered, Widget child) {
  return MouseRegion(
    onEnter: (_) => isHovered.call(true),
    onExit: (_) => isHovered(false),
    child: child,
  );
}
