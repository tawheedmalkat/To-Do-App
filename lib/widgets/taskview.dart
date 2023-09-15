import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_app09/logic/controller.dart';
import 'package:flutter_app09/logic/model.dart';


class TaskView extends StatelessWidget {

  final TaskModel model;


  TaskView(this.model);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(model.title),
      subtitle: Text('${model.date.year} - ${model.date.month} - ${model.date.day}'),
      leading: Icon(Icons.task),
      children: [
        ListTile(
          title: Text(model.description),
        ),
        ElevatedButton(
            onPressed: (){
              TaskController controller = Get.find();
              controller.remove(model);
            },
            child: Text('remove')
        )
      ],
    );
  }
}

