import 'package:flutter/material.dart';
import 'package:pmkit/Model/project.dart';
import 'package:provider/provider.dart';

class ProjectCreatePage extends StatelessWidget {
  ProjectCreatePage({super.key});

  final TextEditingController titleEditController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ProjectModel projectModel = Provider.of<ProjectModel>(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton.outlined(
                  onPressed: () => {Navigator.maybePop(context)},
                  icon: Icon(Icons.close),
                  iconSize: 32,
                  splashRadius: 20,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Center(
                child: Container(
                  width: 800,
                  height: 600,
                  padding: const EdgeInsets.all(10),
                  // decoration: BoxDecoration(
                  //   border: Border.all(
                  //       width: 1.0,
                  //       color: const Color.fromARGB(255, 231, 231, 231)),
                  //   borderRadius: BorderRadius.all(Radius.circular(10)),
                  //   color: Colors.grey[100],
                  // ),
                  child: Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '새 프로젝트 만들기',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 30,
                                ),
                                TextField(
                                  controller: titleEditController,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: '제목을 입력하세요.',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            width: 800,
                            child: ElevatedButton(
                              onPressed: () => {
                                projectModel.createProject(Project(
                                    id: 'uniqueID',
                                    name: titleEditController.text)),
                                Navigator.maybePop(context)
                              },
                              child: const Text('생성'),
                            ),
                          ),
                        ]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
