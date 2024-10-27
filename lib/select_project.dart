import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

//TODO favorite tab

class SelectProject extends StatefulWidget {
  const SelectProject({super.key});

  @override
  State<SelectProject> createState() => _SelectProject();
}

class _SelectProject extends State<SelectProject> {
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text(
        "SIGUSA2",
      ),
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      actions: [
        IconButton(
          onPressed: () {
            print("press setting");
          },
          icon: Icon(Icons.settings),
        )
      ],
    );

    final mainCol = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("test"),
      ],
    );

    final scaffold = Scaffold(
      appBar: appBar,
      body: mainCol,
    );

    return scaffold;
  }
}
