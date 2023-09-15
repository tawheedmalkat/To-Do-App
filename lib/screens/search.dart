import 'package:flutter/material.dart';
import 'package:flutter_app09/logic/controller.dart';
import 'package:flutter_app09/logic/model.dart';
import 'package:flutter_app09/widgets/taskview.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
class Mydelgate extends SearchDelegate{
  @override
  Widget buildSuggestions(BuildContext context) {
    TaskController controller =Get.find();
    List<TaskModel>result =controller.search(query);
    return ListView.builder(itemBuilder:(context,i)=>ListTile(
      onTap:(){query=result[i].title;},
      title: Text(result[i].title),) ,itemCount: result.length,);
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(onPressed:(){query='';} ,icon: Icon(Icons.delete),)
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.close ));
  }

  @override
  Widget buildResults(BuildContext context) {
    TaskController controller =Get.find();
  List<TaskModel>result =controller.search(query);
    return ListView.builder(itemBuilder:(context,i)=>TaskView(result[i]),itemCount: result.length,);
  }
}