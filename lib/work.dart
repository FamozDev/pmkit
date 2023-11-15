import 'package:pmkit/Component/Wrapper.dart';
import 'package:pmkit/Resizable.dart';
import 'package:pmkit/WorkCellTitle.dart';
import 'package:pmkit/workCellRect.dart';
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
              padding: EdgeInsets.only(bottom: 20),
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

class WorkTable extends StatefulWidget {
  const WorkTable({super.key});

  @override
  State<WorkTable> createState() => _WorkTableState();
}

class _WorkTableState extends State<WorkTable> {
  int hoveredIndex = -1;

  @override
  void initState() {
    hoveredIndex = -1;
    super.initState();
  }

  void setHoveredItem(isHover, index) {
    setState(() {
      hoveredIndex = isHover ? index : -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    //
    WorkModel workModel = Provider.of<WorkModel>(context);
    List<Work> workList = workModel.workList;

    return DataTable2(
      border: TableBorder.all(width: 0.1),
      columnSpacing: 3,
      horizontalMargin: 0,
      minWidth: 800,
      headingTextStyle: const TextStyle(
          fontSize: 12, color: Colors.black54, fontWeight: FontWeight.bold),
      headingRowHeight: 30,
      columns: const [
        DataColumn2(
            label: Text('업무명', textAlign: TextAlign.center), fixedWidth: 300),
        DataColumn2(label: Text('상태', textAlign: TextAlign.center)),
        DataColumn2(label: Text('우선순위', textAlign: TextAlign.center)),
        DataColumn2(label: Text('담당자', textAlign: TextAlign.center)),
        DataColumn2(label: Text('시작일', textAlign: TextAlign.center)),
        DataColumn2(label: Text('마감일', textAlign: TextAlign.center)),
        DataColumn2(label: Text('등록일', textAlign: TextAlign.center)),
        DataColumn2(
            label: Text('업무번호', textAlign: TextAlign.center), fixedWidth: 50)
      ],
      rows: List.generate(workList.length, (index) {
        var w = workList[index];
        return DataRow(
            color: hoveredIndex == index
                ? MaterialStateProperty.all(Color.fromARGB(108, 200, 206, 255))
                : null,
            cells: [
              DataCell(
                HoverWrapped(
                  (_) => setHoveredItem(_, index),
                  SizedBox.expand(
                    child: WorkCellTitle(
                        work: w, onTab: (work) => {workModel.selectWork(work)}),
                  ),
                ),
              ),
              DataCell(
                HoverWrapped(
                  (_) => setHoveredItem(_, index),
                  DropdownCell<WorkState>(
                    renderInfo: getStateRenderInfo(w.state),
                    items: [
                      DropdownCellOption(
                          data: WorkState.request,
                          renderInfo: getStateRenderInfo(WorkState.request)),
                      DropdownCellOption(
                          data: WorkState.ing,
                          renderInfo: getStateRenderInfo(WorkState.ing)),
                      DropdownCellOption(
                          data: WorkState.complete,
                          renderInfo: getStateRenderInfo(WorkState.complete)),
                      DropdownCellOption(
                          data: WorkState.feedback,
                          renderInfo: getStateRenderInfo(WorkState.feedback)),
                      DropdownCellOption(
                          data: WorkState.pending,
                          renderInfo: getStateRenderInfo(WorkState.pending)),
                    ],
                    onSelectChange: (WorkState state) =>
                        {workModel.updateWorkState(w, state)},
                  ),
                ),
              ),
              DataCell(
                HoverWrapped(
                  (_) => setHoveredItem(_, index),
                  DropdownCell<WorkPriority>(
                    renderInfo: getPriorityRenderInfo(w.priority),
                    items: [
                      DropdownCellOption(
                          data: WorkPriority.none,
                          renderInfo: getPriorityRenderInfo(WorkPriority.none)),
                      DropdownCellOption(
                          data: WorkPriority.low,
                          renderInfo: getPriorityRenderInfo(WorkPriority.low)),
                      DropdownCellOption(
                          data: WorkPriority.middle,
                          renderInfo:
                              getPriorityRenderInfo(WorkPriority.middle)),
                      DropdownCellOption(
                          data: WorkPriority.high,
                          renderInfo: getPriorityRenderInfo(WorkPriority.high)),
                      DropdownCellOption(
                          data: WorkPriority.immergency,
                          renderInfo:
                              getPriorityRenderInfo(WorkPriority.immergency)),
                    ],
                    onSelectChange: (WorkPriority priority) =>
                        {workModel.updateWorkPriority(w, priority)},
                  ),
                ),
              ),
              DataCell(HoverWrapped(
                  (_) => setHoveredItem(_, index), Text(w.keyman ?? '-'))),
              DataCell(HoverWrapped(
                  (_) => setHoveredItem(_, index), Text(w.begin.toString()))),
              DataCell(HoverWrapped(
                  (_) => setHoveredItem(_, index), Text(w.end.toString()))),
              DataCell(HoverWrapped((_) => setHoveredItem(_, index),
                  Text(w.createdAt.toString()))),
              DataCell(HoverWrapped(
                  (_) => setHoveredItem(_, index), Text(w.number.toString())))
            ]);
      }),
    );
  }
}
