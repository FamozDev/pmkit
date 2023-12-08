import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:pmkit/Model/work.dart';
import 'package:pmkit/feedUpdateEditor.dart';
import 'package:provider/provider.dart';

class WorkDetailPage extends StatelessWidget {
  // PageController pageController;

  WorkDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    QuillController controller;
    var workModel = Provider.of<WorkModel>(context);
    Work? work = workModel.selected;

    if (work?.contents != null) {
      var contentsJson = jsonDecode(work?.contents ?? '');
      controller = QuillController(
          document: Document.fromJson(contentsJson),
          selection: TextSelection.collapsed(offset: 0));
    } else {
      controller = QuillController.basic();
    }

    return Container(
      padding: EdgeInsets.all(24.0),
      child: Column(children: [
        Row(
          children: [
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () => {workModel.selectWork(null)},
            ),
            Text(
              work?.name ?? '',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        FeedUpdateEditor(),
        // QuillProvider(
        //     configurations: QuillConfigurations(controller: controller),
        //     child: QuillEditor.basic(
        //       configurations: const QuillEditorConfigurations(readOnly: true),
        //     ))
      ]),
    );
  }
}
