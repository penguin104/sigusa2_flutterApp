import 'package:flutter/material.dart';
import 'package:sigusa/models.dart';
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
      backgroundColor: colorSet['fourth'],
      appBar: AppBar(
        backgroundColor: colorSet['first'],
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/selectProject');
            },
            icon: Icon(
              Icons.arrow_left,
              color: colorSet['third'],
              size: 40,
            )),
        title: Text(
          selectProject.project_name,
          // "test",
          style: TextStyle(
            color: colorSet['third'],
          ),
        ),
      ),
      body: Container(
        child: ReorderableListView.builder(
          itemCount: selectProject.program.length,
          itemBuilder: (context, index) {
            final action = selectProject.program[index];
            final returnRow = Row(
              children: [
                Expanded(child: ProgramAction(action: action, index: index)),
              ],
            ); //TODO プログラムセルウィジェット実装する

            return ListTile(
              key: Key('$index'), //【注意①】keyが必須になります
              title: returnRow,
            );
          },
          onReorder: (oldIndex, newIndex) {
            setState(() {
              // リストからoldIndexのItemを削除＆取得します
              final item = selectProject.program.removeAt(oldIndex);
              // すると、oldIndex以降のIndexが1つズレるため、
              // oldIndexよりnewIndexが大きい場合はnewIndexに-1する必要があります
              if (newIndex > oldIndex) {
                newIndex -= 1;
              }
              // 先ほど削除した際に取得したItemをnewIndexに挿入します
              selectProject.program.insert(newIndex, item);
            });
          },
        ),
      ),
    );
  }
}

class ProgramAction extends StatelessWidget {
  ProgramModel action;
  int index;
  //TODO if文とかと対応させる

  ProgramAction({
    super.key,
    required this.action,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final programAction = Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(int.parse(action.color)),
      ),
      child: Text(
        action.action,
        style: TextStyle(
          fontSize: 30,
          color: colorSet['third'],
        ),
      ),
    );

    return programAction;
  }
}
