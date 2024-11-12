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
        title: Text(
          selectProject.project_name,
          // "test",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
