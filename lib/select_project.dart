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
      bottom: TabBar(tabs: [
        Tab(
          icon: Icon(
            Icons.list,
            color: Colors.white,
          ),
          child: Text(
            "project",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        Tab(
          icon: Icon(
            Icons.favorite,
            color: Colors.white,
          ),
          child: Text(
            "favorite",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        )
      ]),
    );

    final tabs = DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: appBar,
        body: TabBarView(
          children: [
            Center(
              child: Text("cloud"),
            ),
            Center(
              child: Text("moblie"),
            )
          ],
        ),
      ),
    );
    return tabs;
  }
}
