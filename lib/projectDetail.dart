import 'package:flutter/material.dart';
import 'package:pmkit/Model/project.dart';
import 'package:pmkit/Model/work.dart';
import 'package:pmkit/workDetail.dart';
import 'package:provider/provider.dart';
import 'sideMenu.dart';
import 'work.dart';
import 'workEditor.dart';

class ProjectDetailPage extends StatelessWidget {
  Project selectedProject;

  ProjectDetailPage({super.key, required this.selectedProject});

  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    var workModel = Provider.of<WorkModel>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(selectedProject.name),
        backgroundColor: const Color.fromARGB(255, 95, 32, 243),
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
                WorkPage(pageController: pageController),
                Container(
                  color: Colors.white,
                  child: const Center(
                    child: Text('설정'),
                  ),
                ),
                Container(
                  child: WorkEditor(
                    pageController: pageController,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
