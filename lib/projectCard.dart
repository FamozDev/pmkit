import 'package:flutter/material.dart';
import 'package:pmkit/Model/project.dart';

class ProjectCard extends StatefulWidget {
  void Function()? onClick;
  Project data;
  ProjectCard({super.key, this.onClick, required this.data});

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() {
              isHover = true;
            }),
        onExit: (_) => setState(() {
              isHover = false;
            }),
        child: GestureDetector(
          onTap: () => {widget.onClick?.call()},
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                  strokeAlign: BorderSide.strokeAlignOutside,
                  width: isHover ? 1.2 : .8,
                  color: isHover
                      ? const Color.fromARGB(255, 54, 57, 244)
                      : Color.fromARGB(255, 121, 121, 121)),
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: isHover
                  ? Color.fromARGB(255, 248, 248, 248)
                  : Color.fromARGB(255, 236, 236, 236),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.star_rate_rounded,
                  color: Colors.grey[500],
                ),
                Text(
                  widget.data.name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: isHover
                          ? const Color.fromARGB(255, 54, 57, 244)
                          : Colors.black),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.person,
                      color: Colors.grey[500],
                    ),
                    Text(
                      '1',
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                )
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
          ),
        ));
  }
}
