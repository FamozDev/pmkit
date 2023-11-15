import 'package:flutter/material.dart';
import 'package:pmkit/Component/wk_ColorRect.dart';

enum WorkState { request, ing, feedback, complete, pending }

enum WorkPriority { immergency, high, middle, low, none }

class Work {
  String name;
  String? contents;
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
      required this.number,
      this.contents});

  // Work copyWith({String? name, String? contents, WorkState? state, WorkPriority? priority, String? keyman, DateTime? begin, DateTime? end, DateTime? createdAt, int? number}){
  //   return Work(name: name??this.name, state: state??this.state, priority: priority??this.priority, createdAt: createdAt??this.createdAt, number: number??this.number);
  // }
}

class WorkModel extends ChangeNotifier {
  List<Work> workList;
  Work? selected;

  WorkModel({required this.workList});

  void addNewWork(Work work) {
    workList.add(work);
    notifyListeners();
  }

  void selectWork(Work? work) {
    this.selected = work;
    notifyListeners();
  }

  void updateWorkState(Work work, WorkState state) {
    var index = workList.indexOf(work);
    if (index != -1) {
      workList[index].state = state;
      notifyListeners();
    }
  }

  void updateWorkPriority(Work work, WorkPriority priority) {
    var index = workList.indexOf(work);
    if (index != -1) {
      workList[index].priority = priority;
      notifyListeners();
    }
  }
}

ColorRectRenderInfo getStateRenderInfo(WorkState state) {
  String text;
  Color color;
  switch (state) {
    case WorkState.request:
      text = '요청';
      color = Colors.grey;
      break;
    case WorkState.complete:
      text = '완료';
      color = Colors.green;
      break;
    case WorkState.feedback:
      text = '검수';
      color = Colors.orange;
      break;
    case WorkState.ing:
      text = '진행';
      color = Colors.blue;
      break;
    case WorkState.pending:
      text = '막힘';
      color = Colors.red;
      break;
  }

  return ColorRectRenderInfo(text: text, color: color.withOpacity(0.8));
}

ColorRectRenderInfo getPriorityRenderInfo(WorkPriority priority) {
  String text;
  Color color;
  switch (priority) {
    case WorkPriority.none:
      text = '';
      color = Colors.grey;
      break;
    case WorkPriority.low:
      text = '낮음';
      color = Colors.deepPurple[300] ?? Colors.transparent;
      break;
    case WorkPriority.middle:
      text = '중간';
      color = Colors.deepPurple[400] ?? Colors.transparent;
      break;
    case WorkPriority.high:
      text = '높음';
      color = Colors.deepPurple[700] ?? Colors.transparent;
      break;
    case WorkPriority.immergency:
      text = '긴급';
      color = Colors.deepPurple[900] ?? Colors.transparent;
      break;
  }

  return ColorRectRenderInfo(text: text, color: color.withOpacity(0.8));
}
