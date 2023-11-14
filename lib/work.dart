import 'dart:ffi';
import 'package:pmkit/Resizable.dart';
import 'package:pmkit/WorkCellTitle.dart';
import 'package:pmkit/workCellState.dart';
import 'package:pmkit/workDetail.dart';
import 'package:provider/provider.dart';

import 'Model/work.dart';
import 'workEditor.dart';
import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:anydrawer/anydrawer.dart';

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
    WorkModel workModel = Provider.of<WorkModel>(context);

    List<Work> workList = workModel.workList;

    return Stack(
      children: [
        Column(children: [
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.all(10),
            child: ElevatedButton(
              child: Text('새 업무'),
              onPressed: () => {
                workModel.selectWork(null),
                pageController.jumpToPage(3)
                //   showDrawer(
                //     context,
                //     builder: (context) {
                //       return Center(
                //         child: CreateWorkPannel(),
                //       );
                //     },
                //     config: config,
                //     onClose: () {
                //       debugPrint('Drawer closed');
                //     },
                //     onOpen: () {
                //       debugPrint('Drawer opened');
                //     },
                //   )
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: DataTable2(
                border: TableBorder.all(width: 0.1),
                columnSpacing: 3,
                horizontalMargin: 0,
                minWidth: 800,
                headingTextStyle: const TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold),
                headingRowHeight: 30,
                columns: const [
                  DataColumn2(
                      label: Text('업무명', textAlign: TextAlign.center),
                      fixedWidth: 300),
                  DataColumn2(label: Text('상태', textAlign: TextAlign.center)),
                  DataColumn2(label: Text('우선순위', textAlign: TextAlign.center)),
                  DataColumn2(label: Text('담당자', textAlign: TextAlign.center)),
                  DataColumn2(label: Text('시작일', textAlign: TextAlign.center)),
                  DataColumn2(label: Text('마감일', textAlign: TextAlign.center)),
                  DataColumn2(label: Text('등록일', textAlign: TextAlign.center)),
                  DataColumn2(
                      label: Text('업무번호', textAlign: TextAlign.center),
                      fixedWidth: 50)
                ],
                rows: [
                  for (var w in workList)
                    DataRow(cells: [
                      DataCell(SizedBox.expand(
                        child: WorkCellTitle(
                            work: w,
                            onTab: (work) => {
                                  workModel.selectWork(work),
                                }),
                      )),
                      DataCell(WorkCellState(work: w)),
                      DataCell(Text(w.priority.toString())),
                      DataCell(Text(w.keyman ?? '-')),
                      DataCell(Text(w.begin.toString())),
                      DataCell(Text(w.end.toString())),
                      DataCell(Text(w.createdAt.toString())),
                      DataCell(Text(w.number.toString()))
                    ])
                ],
              ),
            ),
          ),
        ]),
        workModel.selected != null
            ? Positioned(
                top: 0,
                right: 0,
                child: Resizable(child: WorkDetailPage()),
              )
            : Container(),
      ],
    );

    // InteractiveViewer(
    //   scaleEnabled: false,
    //   child: Scrollbar(
    //     controller: vertical_scrollController,
    //     child: Scrollbar(
    //       controller: horizontal_scrollController,
    //       child: SingleChildScrollView(
    //         scrollDirection: Axis.horizontal,
    //         controller: vertical_scrollController,
    //         child: SingleChildScrollView(
    //             controller: horizontal_scrollController,
    //             scrollDirection: Axis.vertical,
    //             child: DataTable(
    //               columns: [
    //                 DataColumn(label: const Text('업무명')),
    //                 DataColumn(label: const Text('상태')),
    //                 DataColumn(label: const Text('우선순위')),
    //                 DataColumn(label: const Text('담당자')),
    //                 DataColumn(label: const Text('시작일')),
    //                 DataColumn(label: const Text('마감일')),
    //                 DataColumn(label: const Text('등록일')),
    //                 DataColumn(label: const Text('업무번호'))
    //               ],
    //               rows: [
    //                 for (var w in workList)
    //                   DataRow(cells: [
    //                     DataCell(Text(w.name)),
    //                     DataCell(Text(w.state.toString())),
    //                     DataCell(Text(w.priority.toString())),
    //                     DataCell(Text(w.keyman ?? '-')),
    //                     DataCell(Text(w.begin.toString())),
    //                     DataCell(Text(w.end.toString())),
    //                     DataCell(Text(w.createdAt.toString())),
    //                     DataCell(Text(w.number.toString()))
    //                   ])
    //               ],
    //             )),
    //       ),
    //     ),
    //   ),
    // );
  }
}
