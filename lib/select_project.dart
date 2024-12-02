import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:sigusa/models.dart';
import 'main.dart';

//TODO favorite tab

Map<String, dynamic> colorSet = {
  'first': Color.fromRGBO(44, 119, 132, 1),
  'second': Color.fromRGBO(234, 153, 58, 1),
  'third': Color.fromRGBO(228, 221, 179, 1),
  'fourth': Color.fromRGBO(143, 207, 193, 1),
  'fifth': Color.fromRGBO(169, 70, 29, 1),
};

var projectList = [];
var selectProject;

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
      automaticallyImplyLeading: false,
      title: Text(
        "SIGUSA2",
        style: TextStyle(
          fontSize: 30,
        ),
      ),
      backgroundColor: colorSet['first'],
      foregroundColor: colorSet['third'],
      actions: [
        IconButton(
          onPressed: () {
            print("press setting");
          },
          icon: Icon(
            Icons.settings,
            color: colorSet['third'],
          ),
        )
      ],
      bottom: TabBar(indicatorColor: colorSet['second'], tabs: [
        Tab(
          icon: Icon(
            Icons.list,
            color: colorSet['third'],
          ),
          child: Text(
            "project",
            style: TextStyle(
              color: colorSet['third'],
            ),
          ),
        ),
        Tab(
          icon: Icon(
            Icons.favorite,
            color: colorSet['third'],
          ),
          child: Text(
            "favorite",
            style: TextStyle(
              color: colorSet['third'],
            ),
          ),
        )
      ]),
    );

    final tabs = DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: colorSet['fourth'],
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
            return ProjectListItem(
              project: item,
              index: index,
            );
          }),
    );
  }
}

class ProjectListItem extends StatelessWidget {
  ProjectModel project;
  int index;
  ProjectListItem({
    super.key,
    required this.project,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          selectProject = projectList[index];
          Navigator.pushNamed(context, '/programEdit');
        },
        child: Container(
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              color: colorSet['third'],
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
                            color: colorSet['first'],
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // TODO 編集画面に繊維
                        },
                        icon: Icon(
                          Icons.edit,
                          color: colorSet['fourth'],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          // TODO このプロジェクトを削除 ダイアログを表示
                        },
                        icon: Icon(
                          Icons.delete,
                          color: colorSet['fourth'],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
