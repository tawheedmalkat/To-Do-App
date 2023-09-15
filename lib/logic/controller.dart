import 'model.dart';
import 'package:get/get.dart';

class TaskController extends GetxController{

  final List<TaskModel> _tasks =[];

  void add(TaskModel model){
    _tasks.add(model);
    update();
  }

  void remove(TaskModel model){
    _tasks.remove(model);
    update();
  }

  List<TaskModel> get tasks => _tasks;
  List<TaskModel> search(String val){
    return _tasks.where((element)
    { if (val.isEmpty)return false;
      if(val.length>element.title.length)return false;
    else if(val==element.title)return true;
    String s=element.title.substring(0,val.length);return s==val;}
    ).toList();
  }


}
