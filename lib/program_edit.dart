import 'package:flutter/material.dart';
import 'main.dart';
import 'select_project.dart';

class ProgramEdit extends StatefulWidget {
  const ProgramEdit({super.key});

  @override
  State<ProgramEdit> createState() => _ProgramEditState();
}

class _ProgramEditState extends State<ProgramEdit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/selectProject');
            },
            icon: Icon(
              Icons.arrow_left,
              color: Colors.white,
              size: 40,
            )),
        title: Text(
          selectProject.project_name,
          // "test",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: selectProject.program.length,
            itemBuilder: (context, index) {
              final action = selectProject.program[index];
              return Text(action.action);//TODO プログラムセルウィジェット実装する
            }),
      ),
    );
  }
}
