import 'package:pmkit/Component/Wrapper.dart';
import 'package:pmkit/DateSelector.dart';
import 'package:pmkit/WorkCellTitle.dart';
import 'package:pmkit/StateSelector.dart';

import 'Model/work.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';

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
                  StateSelector<WorkState>(
                    renderInfo: getStateRenderInfo(w.state),
                    items: [
                      StateOption(
                          data: WorkState.request,
                          renderInfo: getStateRenderInfo(WorkState.request)),
                      StateOption(
                          data: WorkState.ing,
                          renderInfo: getStateRenderInfo(WorkState.ing)),
                      StateOption(
                          data: WorkState.complete,
                          renderInfo: getStateRenderInfo(WorkState.complete)),
                      StateOption(
                          data: WorkState.feedback,
                          renderInfo: getStateRenderInfo(WorkState.feedback)),
                      StateOption(
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
                  StateSelector<WorkPriority>(
                    renderInfo: getPriorityRenderInfo(w.priority),
                    items: [
                      StateOption(
                          data: WorkPriority.none,
                          renderInfo: getPriorityRenderInfo(WorkPriority.none)),
                      StateOption(
                          data: WorkPriority.low,
                          renderInfo: getPriorityRenderInfo(WorkPriority.low)),
                      StateOption(
                          data: WorkPriority.middle,
                          renderInfo:
                              getPriorityRenderInfo(WorkPriority.middle)),
                      StateOption(
                          data: WorkPriority.high,
                          renderInfo: getPriorityRenderInfo(WorkPriority.high)),
                      StateOption(
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
              DataCell(
                HoverWrapped(
                    (_) => setHoveredItem(_, index),
                    DateSelector(
                      onSelectChange: (p0) =>
                          {workModel.updateBeginDate(w, p0)},
                      selectedDate: w.begin,
                    )),
              ),
              DataCell(
                HoverWrapped(
                    (_) => setHoveredItem(_, index),
                    DateSelector(
                      onSelectChange: (p0) => {workModel.updateEndDate(w, p0)},
                      selectedDate: w.end,
                    )),
              ),
              DataCell(HoverWrapped((_) => setHoveredItem(_, index),
                  Text(w.createdAt.toString()))),
              DataCell(HoverWrapped(
                  (_) => setHoveredItem(_, index), Text(w.number.toString())))
            ]);
      }),
    );
  }
}
