import 'package:flutter/material.dart';
import 'package:pmkit/Model/work.dart';

class WorkCellState extends StatefulWidget {
  Work work;
  void Function(Work)? onTab;
  WorkCellState({super.key, required this.work, this.onTab});

  @override
  State<WorkCellState> createState() => _WorkCellStateState();
}

class _WorkCellStateState extends State<WorkCellState> {
  bool isHover = false;
  Color color = Colors.black;
  String text = '';

  @override
  void initState() {
    switch (widget.work.state) {
      case WorkState.request:
        text = '요청';
        color = Colors.grey;
        break;
      case WorkState.complete:
        text = '완료';
        color = Colors.green;
        break;
      case WorkState.feedback:
        text = '검수';
        color = Colors.orange;
        break;
      case WorkState.ing:
        text = '진행';
        color = Colors.blue;
        break;
      case WorkState.pending:
        text = '막힘';
        color = Colors.red;
        break;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onTab?.call(widget.work),
      child: MouseRegion(
        onEnter: (event) => {
          setState(
            () => isHover = true,
          )
        },
        onExit: (event) => {
          setState(
            () => isHover = false,
          )
        },
        cursor: SystemMouseCursors.click,
        child: Container(
          alignment: Alignment.center,
          // padding: EdgeInsets.all(20),
          decoration: BoxDecoration(color: color),
          child: Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
