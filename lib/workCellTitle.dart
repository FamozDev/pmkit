import 'package:flutter/material.dart';
import 'package:pmkit/Model/work.dart';

class WorkCellTitle extends StatefulWidget {
  Work work;
  void Function(Work)? onTab;
  WorkCellTitle({super.key, required this.work, this.onTab});

  @override
  State<WorkCellTitle> createState() => _WorkCellTitleState();
}

class _WorkCellTitleState extends State<WorkCellTitle> {
  bool isHover = false;
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
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 30),
          decoration: isHover
              ? BoxDecoration(color: Color.fromARGB(123, 226, 192, 255))
              : null,
          child: isHover
              ? Container(
                  width: 150,
                  height: 30,
                  padding: EdgeInsets.all(5),
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                      color: Colors.white54,
                      borderRadius: BorderRadius.all(Radius.circular(2)),
                      border: Border.all(
                          color: Color.fromARGB(255, 181, 95, 255),
                          width: 0.2,
                          strokeAlign: BorderSide.strokeAlignOutside)),
                  child: Text(widget.work.name),
                )
              : Text(widget.work.name),
        ),
      ),
    );
  }
}
