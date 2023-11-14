import 'package:flutter/material.dart';

class Resizable extends StatefulWidget {
  Widget child;
  double defaultWidth;

  Resizable({super.key, required this.child, this.defaultWidth = 500});

  @override
  State<Resizable> createState() => _ResizableState();
}

class _ResizableState extends State<Resizable> {
  double width = 0;
  bool isHover = false;
  @override
  void initState() {
    width = widget.defaultWidth;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          color: Colors.grey[100],
          border: const Border(left: BorderSide(color: Colors.grey)),
          boxShadow: const [
            BoxShadow(
                blurRadius: 10,
                spreadRadius: 10,
                color: Color.fromARGB(100, 77, 77, 77),
                offset: Offset(10, 0))
          ]),
      child: Row(children: [
        GestureDetector(
          onHorizontalDragUpdate: (details) {
            setState(() {
              width -= details.primaryDelta!;
            });
          },
          child: MouseRegion(
            onEnter: (event) => setState(() {
              isHover = true;
            }),
            onExit: (event) => setState(() {
              isHover = false;
            }),
            cursor: SystemMouseCursors.resizeLeftRight,
            child: Container(
              width: 10,
              color: isHover ? Colors.grey.withAlpha(125) : Colors.transparent,
            ),
          ),
        ),
        Expanded(child: widget.child),
      ]),
    );
  }
}
