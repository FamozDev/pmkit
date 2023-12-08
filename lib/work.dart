import 'package:pmkit/Resizable.dart';
import 'package:pmkit/workDetail.dart';
import 'package:provider/provider.dart';

import 'Model/work.dart';
import 'package:flutter/material.dart';
import 'package:anydrawer/anydrawer.dart';
import 'workTable.dart';

class WorkPage extends StatelessWidget {
  WorkPage({
    super.key,
    required this.pageController,
  });

  // final List<Work> workList;
  final PageController pageController;

  DrawerConfig config = const DrawerConfig(
    borderRadius: 0,
  );

  // final vertical_scrollController = ScrollController();
  // final horizontal_scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(children: [
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.all(10),
            child: ElevatedButton(
              child: Text('새 업무'),
              onPressed: () => {
                context.read<WorkModel>().selectWork(null),
                pageController.jumpToPage(3)
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: WorkTable(),
            ),
          ),
        ]),
        WorkDetailPanel(),
      ],
    );
  }
}

class WorkDetailPanel extends StatefulWidget {
  const WorkDetailPanel({super.key});

  @override
  State<WorkDetailPanel> createState() => _WorkDetailPanelState();
}

class _WorkDetailPanelState extends State<WorkDetailPanel> {
  @override
  Widget build(BuildContext context) {
    WorkModel workModel = Provider.of<WorkModel>(context);

    return workModel.selected != null
        ? Positioned(
            top: 0,
            right: 0,
            child: Resizable(child: WorkDetailPage()),
          )
        : Container();
  }
}
