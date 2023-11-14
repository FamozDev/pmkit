import 'package:flutter/material.dart';
import 'package:pmkit/Model/project.dart';
import 'package:pmkit/home.dart';
import 'package:pmkit/projectDetail.dart';
import 'package:provider/provider.dart';

import 'Model/work.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  ProjectModel projectModel = ProjectModel(projectList: []);
  WorkModel workController = WorkModel(workList: [
    Work(
        name: '테스트 업무',
        createdAt: DateTime.now(),
        priority: WorkPriority.high,
        state: WorkState.request,
        number: 0),
    Work(
        name: '테스트 업무',
        createdAt: DateTime.now(),
        priority: WorkPriority.high,
        state: WorkState.request,
        number: 0),
    Work(
        name: '테스트 업무',
        createdAt: DateTime.now(),
        priority: WorkPriority.high,
        state: WorkState.request,
        number: 0),
    Work(
        name: '테스트 업무',
        createdAt: DateTime.now(),
        priority: WorkPriority.high,
        state: WorkState.ing,
        number: 0),
    Work(
        name: '테스트 업무',
        createdAt: DateTime.now(),
        priority: WorkPriority.high,
        state: WorkState.feedback,
        number: 0),
    Work(
        name: '테스트 업무',
        createdAt: DateTime.now(),
        priority: WorkPriority.high,
        state: WorkState.pending,
        number: 0),
    Work(
        name: '테스트 업무',
        createdAt: DateTime.now(),
        priority: WorkPriority.high,
        state: WorkState.request,
        number: 0),
    Work(
        name: '테스트 업무',
        createdAt: DateTime.now(),
        priority: WorkPriority.high,
        state: WorkState.request,
        number: 0),
    Work(
        name: '테스트 업무',
        createdAt: DateTime.now(),
        priority: WorkPriority.high,
        state: WorkState.request,
        number: 0),
    Work(
        name: '테스트 업무',
        createdAt: DateTime.now(),
        priority: WorkPriority.high,
        state: WorkState.request,
        number: 0),
    Work(
        name: '테스트 업무',
        createdAt: DateTime.now(),
        priority: WorkPriority.high,
        state: WorkState.request,
        number: 0),
    Work(
        name: '테스트 업무',
        createdAt: DateTime.now(),
        priority: WorkPriority.high,
        state: WorkState.request,
        number: 0),
    Work(
        name: '테스트 업무',
        createdAt: DateTime.now(),
        priority: WorkPriority.high,
        state: WorkState.request,
        number: 0),
  ]);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: this.workController,
        ),
        ChangeNotifierProvider.value(value: this.projectModel),
      ],
      child: MaterialApp(home: Home()),
    );
  }
}
