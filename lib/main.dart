import 'package:flutter/material.dart';
import 'package:sigusa/program_edit.dart';

import 'select_project.dart';

void main() {
  runApp(MaterialApp(
    routes: <String, WidgetBuilder>{
      '/selectProject': (BuildContext context) => SelectProject(),
      '/programEdit': (BuildContext context) => ProgramEdit(),
// TODO 画面を追加
    },
    initialRoute: '/selectProject',
  ));
} 
