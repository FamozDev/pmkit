import 'package:flutter/material.dart';

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
}
