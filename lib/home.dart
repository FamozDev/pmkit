import 'package:flutter/material.dart';
import 'package:pmkit/project.dart';

class Home extends StatelessWidget {
  Home({super.key});

  ScrollController scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('프로젝트 선택'),
        backgroundColor: Color.fromARGB(255, 95, 32, 243),
      ),
      body: ProjectPage(),
    );
  }
}


// Center(
//         child: Scrollbar(
//           controller: scrollController,
//           child: SingleChildScrollView(
//             controller: scrollController,
//             scrollDirection: Axis.horizontal,
//             child: Container(
//               padding: EdgeInsets.all(20),
//               color: const Color.fromARGB(255, 156, 156, 156),
//               constraints: BoxConstraints(maxWidth: 1080),
//               child: Wrap(
//                 alignment: WrapAlignment.start,
//                 direction: Axis.horizontal,
//                 runSpacing: 10,
//                 spacing: 10,
//                 // runSpacing: 10,
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.all(8),
//                     width: 250,
//                     height: 150,
//                     child: ProjectCard(),
//                   ),
//                   Container(
//                     padding: const EdgeInsets.all(8),
//                     width: 250,
//                     height: 150,
//                     color: Colors.teal[200],
//                     child: const Text('Heed not the rabble'),
//                   ),
//                   Container(
//                     padding: const EdgeInsets.all(8),
//                     width: 250,
//                     height: 150,
//                     color: Colors.teal[300],
//                     child: const Text('Sound of screams but the'),
//                   ),
//                   Container(
//                     width: 250,
//                     height: 150,
//                     padding: const EdgeInsets.all(8),
//                     color: Colors.teal[400],
//                     child: const Text('Who scream'),
//                   ),
//                   Container(
//                     width: 250,
//                     height: 150,
//                     padding: const EdgeInsets.all(8),
//                     color: Colors.teal[500],
//                     child: const Text('Revolution is coming...'),
//                   ),
//                   Container(
//                     width: 250,
//                     height: 150,
//                     padding: const EdgeInsets.all(8),
//                     color: Colors.teal[600],
//                     child: const Text('Revolution, they...'),
//                   ),
//                   Container(
//                     width: 250,
//                     height: 150,
//                     padding: const EdgeInsets.all(8),
//                     color: Colors.teal[600],
//                     child: const Text('Revolution, they...'),
//                   ),
//                   Container(
//                     width: 250,
//                     height: 150,
//                     padding: const EdgeInsets.all(8),
//                     color: Colors.teal[600],
//                     child: const Text('Revolution, they...'),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),