import 'package:flutter/material.dart';
import 'sideMenu.dart';
import 'work.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  List<Work> workList = [
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
  ];

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController();

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text('PM Kit'),
          backgroundColor: Color.fromARGB(255, 95, 32, 243),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            LeftNavBar(
              pageController: pageController,
            ),
            Expanded(
              child: PageView(
                controller: pageController,
                children: [
                  Container(
                    color: Colors.white,
                    child: const Center(
                      child: Text('대시보드'),
                    ),
                  ),
                  WorkPage(workList: this.workList),
                  Container(
                    color: Colors.white,
                    child: const Center(
                      child: Text('세팅'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
