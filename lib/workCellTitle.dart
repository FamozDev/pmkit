import 'package:flutter/material.dart';
import 'package:pmkit/Model/work.dart';

class WorkCellTitle extends StatefulWidget {
  Work work;
  void Function(Work)? onTab;
  void Function(Work)? onEditTitle;
  void Function()? onEditCancel;
  void Function(Work, String)? onEditComplete;
  bool isEditMode;

  WorkCellTitle(
      {super.key,
      required this.work,
      required this.isEditMode,
      this.onEditCancel,
      this.onTab,
      this.onEditComplete,
      this.onEditTitle});

  @override
  State<WorkCellTitle> createState() => _WorkCellTitleState();
}

class _WorkCellTitleState extends State<WorkCellTitle> {
  bool isHover = false;
  TextEditingController controller = TextEditingController();

  @override
  void didUpdateWidget(covariant WorkCellTitle oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isEditMode != widget.isEditMode) {
      controller.text = widget.work.name;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onTab?.call(widget.work);
      },
      child: widget.isEditMode
          ? Padding(
              padding: const EdgeInsets.only(top: 3, bottom: 3),
              child: TextField(
                controller: controller,
                onEditingComplete: () {
                  widget.onEditComplete?.call(widget.work, controller.text);
                  setState(
                    () => isHover = false,
                  );
                },
                onTapOutside: (evnet) {
                  widget.onEditCancel?.call();
                  setState(
                    () => isHover = false,
                  );
                },
                autofocus: true,
                style: const TextStyle(fontSize: 12),
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            )
          : MouseRegion(
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
                  padding: const EdgeInsets.only(left: 30),
                  decoration: isHover
                      ? const BoxDecoration(
                          color: Color.fromARGB(123, 226, 192, 255))
                      : null,
                  child: isHover
                      ? GestureDetector(
                          onTap: () => widget.onEditTitle?.call(widget.work),
                          child: MouseRegion(
                            cursor: SystemMouseCursors.text,
                            child: Container(
                              width: 150,
                              height: 30,
                              padding: EdgeInsets.all(5),
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                color: Colors.white54,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(2)),
                                border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 181, 95, 255),
                                  width: 0.2,
                                  strokeAlign: BorderSide.strokeAlignOutside,
                                ),
                              ),
                              child: Text(widget.work.name),
                            ),
                          ),
                        )
                      : Text(widget.work.name)),
            ),
    );
  }
}
