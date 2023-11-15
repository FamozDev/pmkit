import 'package:flutter/material.dart';

class ColorRectRenderInfo {
  String text;
  Color color;
  ColorRectRenderInfo({required this.text, required this.color});
}

class ColorRect extends StatefulWidget {
  ColorRectRenderInfo renderInfo;
  TextStyle? textStyle;
  double? width;
  double? height;
  void Function()? onTap;
  ColorRect({
    super.key,
    required this.renderInfo,
    this.textStyle,
    this.width,
    this.height,
    this.onTap,
  });

  @override
  State<ColorRect> createState() => _ColorRectState();
}

class _ColorRectState extends State<ColorRect> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: MouseRegion(
        onEnter: (event) => setState(() {
          isHover = true;
        }),
        onExit: (event) => setState(() {
          isHover = false;
        }),
        child: Container(
          width: widget.width,
          height: widget.height,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: isHover
                  ? widget.renderInfo.color.withOpacity(0.7)
                  : widget.renderInfo.color),
          child: Text(
            widget.renderInfo.text,
            style: widget.textStyle ?? TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
