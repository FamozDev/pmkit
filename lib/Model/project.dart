import 'package:flutter/material.dart';

class Project {
  String id;
  String name;

  Project({required this.id, required this.name});
}

class ProjectModel extends ChangeNotifier {
  List<Project> projectList;

  ProjectModel({required this.projectList});

  void createProject(Project project) {
    projectList.add(project);
    notifyListeners();
  }
}
