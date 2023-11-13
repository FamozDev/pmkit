import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:anydrawer/anydrawer.dart';

enum WorkState { request, ing, feedback, complete, pending }

enum WorkPriority { immergency, high, middle, low, none }

class Work {
  String name;
  WorkState state;
  WorkPriority priority;
  String? keyman;
  DateTime? begin;
  DateTime? end;
  DateTime createdAt;
  int number;

  Work(
      {required this.name,
      required this.state,
      required this.priority,
      this.keyman,
      this.begin,
      this.end,
      required this.createdAt,
      required this.number});
}

class WorkPage extends StatelessWidget {
  WorkPage({super.key, required this.workList});

  final List<Work> workList;
  DrawerConfig config = const DrawerConfig();
  final AnyDrawerController controller = AnyDrawerController();

  // final vertical_scrollController = ScrollController();
  // final horizontal_scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.all(10),
        child: ElevatedButton(
          child: Text('새 업무'),
          onPressed: () => {
            showDrawer(
              context,
              builder: (context) {
                return Center(
                  child: const Text('Right Drawer'),
                );
              },
              config: config,
              onClose: () {
                debugPrint('Drawer closed');
              },
              onOpen: () {
                debugPrint('Drawer opened');
              },
              controller: controller,
            )
          },
        ),
      ),
      Expanded(
        child: DataTable2(
          columnSpacing: 12,
          horizontalMargin: 12,
          minWidth: 800,
          headingTextStyle: const TextStyle(
              fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),
          headingRowHeight: 20,
          columns: [
            const DataColumn2(
              label: const Text('업무명'),
            ),
            DataColumn2(label: const Text('상태', textAlign: TextAlign.center)),
            DataColumn2(label: const Text('우선순위', textAlign: TextAlign.center)),
            DataColumn2(label: const Text('담당자', textAlign: TextAlign.center)),
            DataColumn2(label: const Text('시작일', textAlign: TextAlign.center)),
            DataColumn2(label: const Text('마감일', textAlign: TextAlign.center)),
            DataColumn2(label: const Text('등록일', textAlign: TextAlign.center)),
            DataColumn2(
                label: const Text('업무번호', textAlign: TextAlign.center),
                fixedWidth: 50)
          ],
          rows: [
            for (var w in workList)
              DataRow(cells: [
                DataCell(Text(w.name)),
                DataCell(Text(w.state.toString())),
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
    ]);

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
