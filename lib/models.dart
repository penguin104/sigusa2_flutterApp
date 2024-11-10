import 'dart:convert';

class ProgramModel {
  String action;
  String color;
  ProgramModel({
    required this.action,
    required this.color,
  });

  ProgramModel.fromJson(Map<String, dynamic> json)
      : action = json["action"],
        color = json["color"];
}

class ProjectModel {
  int project_id;
  String project_name;
  List<ProgramModel> program;
  ProjectModel({
    required this.project_id,
    required this.project_name,
    required this.program,
  });

  ProjectModel.fromJson(Map<String, dynamic> json)
      : project_id = json["project_id"],
        project_name = json["project_name"],
        program = (json["program"] as List)
            .map((e) => ProgramModel.fromJson(e))
            .toList();
}
