import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Model/work.dart';
import 'package:flutter_quill/flutter_quill.dart';

class WorkEditor extends StatefulWidget {
  PageController pageController;

  WorkEditor({super.key, required this.pageController});

  @override
  State<WorkEditor> createState() => _WorkEditorState();
}

class _WorkEditorState extends State<WorkEditor> {
  // bool isEditMode = false;
  final TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    WorkModel workModel = Provider.of<WorkModel>(context);
    Work? selected = workModel.selected;
    titleController.text = selected?.name ?? '';
    QuillController controller;
    if (selected != null && selected.contents != null) {
      controller = QuillController(
          document: Document.fromJson(jsonDecode(selected.contents ?? '')),
          selection: TextSelection.collapsed(offset: 0));
    } else {
      controller = QuillController.basic();
    }

    return Container(
      padding: EdgeInsets.all(24.0),
      child: Column(
        children: [
          Row(
            children: [
              BackButton(
                onPressed: () => {widget.pageController.jumpToPage(1)},
              ),
              Text(
                selected != null ? '업무 수정' : '업무 작성',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: TextField(
              controller: this.titleController,
              decoration: const InputDecoration(
                labelText: '업무 제목',
                hintText: '업무 제목을 작성합니다.',
              ),
            ),
          ),
          Expanded(
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
                      configurations: const QuillEditorConfigurations(
                        readOnly: false,
                        placeholder: '내용을 입력하세요.',
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
                            onPressed: () => {
                                  workModel.addNewWork(Work(
                                      name: titleController.text,
                                      contents: jsonEncode(controller.document
                                          .toDelta()
                                          .toJson()),
                                      state: WorkState.request,
                                      priority: WorkPriority.high,
                                      createdAt: DateTime.now(),
                                      number: 10)),
                                  widget.pageController.jumpToPage(1)
                                },
                            child: const Text('등록'))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
