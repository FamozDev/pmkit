import 'package:flutter/material.dart';
import 'package:pmkit/Model/project.dart';
import 'package:pmkit/newProject.dart';
import 'package:pmkit/projectCard.dart';
import 'package:pmkit/projectDetail.dart';
import 'package:provider/provider.dart';

class ProjectPage extends StatelessWidget {
  const ProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    ProjectModel projectModel = Provider.of<ProjectModel>(context);
    return Container(
      padding: EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              padding: EdgeInsets.only(bottom: 20),
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('참여중',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  ElevatedButton.icon(
                      onPressed: () => {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ProjectCreatePage();
                            }))
                          },
                      style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0),
                          backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 95, 32, 243)),
                          fixedSize: MaterialStateProperty.all(Size(150, 40))),
                      icon: Icon(Icons.new_label),
                      label: Text(
                        '새 프로젝트',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                ],
              )),
          Expanded(
            child: GridView.builder(
                padding: EdgeInsets.all(5),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  childAspectRatio: 250 / 150,
                  mainAxisExtent: 150,
                  maxCrossAxisExtent: 250,
                  // crossAxisCount: 4,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: projectModel.projectList.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: 250,
                    height: 150,
                    child: ProjectCard(
                      data: projectModel.projectList[index],
                      onClick: () => {
                        Navigator.push((context),
                            MaterialPageRoute(builder: (context) {
                          return ProjectDetailPage(
                              selectedProject: projectModel.projectList[index]);
                        }))
                      },
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
