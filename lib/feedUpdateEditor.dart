import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class FeedUpdateEditor extends StatefulWidget {
  const FeedUpdateEditor({super.key});

  @override
  State<FeedUpdateEditor> createState() => _FeedUpdateEditorState();
}

class _FeedUpdateEditorState extends State<FeedUpdateEditor> {
  bool isHover = false;
  bool isEditMode = false;
  @override
  Widget build(BuildContext context) {
    QuillController controller = QuillController.basic();
    return isEditMode == false
        ? GestureDetector(
            onTap: () {
              setState(() {
                isEditMode = true;
              });
            },
            child: MouseRegion(
              onEnter: (event) {
                setState(() {
                  isHover = true;
                });
              },
              onExit: (event) {
                setState(() {
                  isHover = false;
                });
              },
              cursor: SystemMouseCursors.text,
              child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  child: Text("업데이트 작성..."),
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: Color.fromARGB(255, 61, 90, 255)),
                      borderRadius: BorderRadius.all(
                        Radius.circular(7),
                      ),
                      color:
                          isHover ? Color.fromARGB(110, 179, 190, 255) : null)),
            ),
          )
        : Container(
            height: 250,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                border: Border.all(color: Color.fromARGB(255, 61, 90, 255)),
                borderRadius: BorderRadius.all(
                  Radius.circular(7),
                ),
                color: Colors.white),
            child: QuillProvider(
              configurations: QuillConfigurations(
                controller: controller,
                sharedConfigurations: const QuillSharedConfigurations(),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const QuillToolbar(
                      configurations: QuillToolbarConfigurations(
                    showDividers: false,
                    showClearFormat: false,
                    showHeaderStyle: false,
                    showBackgroundColorButton: false,
                    showColorButton: false,
                    multiRowsDisplay: false,
                    showFontFamily: false,
                    showFontSize: false,
                    showSubscript: false,
                    showSuperscript: false,
                    showSearchButton: false,
                    showLink: false,
                    showUndo: false,
                    showRedo: false,
                    showIndent: false,
                  )),
                  Expanded(
                    child: QuillEditor.basic(
                      configurations: QuillEditorConfigurations(
                        readOnly: false,
                        autoFocus: true,
                        onTapOutside: (event, focusNode) {
                          if (controller.document.isEmpty()) {
                            setState(() {
                              isEditMode = false;
                            });
                          }
                        },
                        padding: EdgeInsets.all(10),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      border: Border(top: BorderSide(color: Colors.black12)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                            onPressed: () => {}, child: const Text('등록'))
                      ],
                    ),
                  ),
                ],
              ),
            ));
  }
}
