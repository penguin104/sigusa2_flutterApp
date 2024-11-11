import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:sigusa/models.dart';

//TODO favorite tab

var projectList = [];

class SelectProject extends StatefulWidget {
  const SelectProject({super.key});

  @override
  State<SelectProject> createState() => _SelectProject();
}

class _SelectProject extends State<SelectProject> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    init();
  }

  Future<void> init() async {
    var listTemp = jsonDecode(await rootBundle
            .loadString("assets/json/default_project_data.json"))
        .map<ProjectModel>((e) => ProjectModel.fromJson(e))
        .toList();
    setState(() {
      projectList = listTemp;
      print(projectList);
    });
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      title: Text(
        "SIGUSA2",
        style: TextStyle(
          fontSize: 30,
        ),
      ),
      backgroundColor: Colors.indigo,
      foregroundColor: Colors.white,
      actions: [
        IconButton(
          onPressed: () {
            print("press setting");
          },
          icon: Icon(Icons.settings),
        )
      ],
      bottom: TabBar(indicatorColor: Colors.amber, tabs: [
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
          children: [ProjectLists(), FavoriteProjects()],
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
    return Column(
      children: [],
    );
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
    return Container(
      child: ListView.builder(
          itemCount: projectList.length,
          itemBuilder: (context, index) {
            final item = projectList[index];
            return ProjectListItem(project: item);
          }),
    );
  }
}

class ProjectListItem extends StatelessWidget {
  ProjectModel project;
  ProjectListItem({
    super.key,
    required this.project,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Container(
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            color: Colors.indigo,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        project.project_name,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // TODO 編集画面に繊維
                      },
                      icon: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // TODO このプロジェクトを削除 ダイアログを表示
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
