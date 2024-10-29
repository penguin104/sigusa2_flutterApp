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
            ProjectLists(),
            FavoriteProjects()
          ],
        ),
      ),
    );
    return tabs;
  }
}

class FavoriteProjects extends StatefulWidget {
  const FavoriteProjects({
    super.key,
  });

  @override
  State<FavoriteProjects> createState() => _FavoriteProjectsState();
}

class _FavoriteProjectsState extends State<FavoriteProjects> {
  @override
  Widget build(BuildContext context) {
    return Column();
  }
}

class ProjectLists extends StatefulWidget {
  const ProjectLists({
    super.key,
  });

  @override
  State<ProjectLists> createState() => _ProjectListsState();
}

class _ProjectListsState extends State<ProjectLists> {
  @override
  Widget build(BuildContext context) {
    return Column();
  }
}


