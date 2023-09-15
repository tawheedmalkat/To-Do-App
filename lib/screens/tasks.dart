import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_app09/logic/controller.dart';
import 'package:flutter_app09/logic/model.dart';
import 'package:flutter_app09/widgets/input.dart';


class AddScreen extends StatelessWidget {

  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  DateTime? _date;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Task'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyTextField(
              controller: titleController,
              hint: 'Title',
              icon: Icon(Icons.title),
            ),
            MyTextField(
              controller: descriptionController,
              hint: 'Description',
              maxLines: 3,
            ),
            ListTile(
              leading: Icon(Icons.date_range_outlined),
              title: Text('Date'),
              subtitle: Text('select date'),
              onTap: () async {
                _date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(
                        Duration(
                            days: 365
                        )
                    )
                );
              },
            ),
            SizedBox(height: size.height*0.05,),
            ElevatedButton(
                onPressed: (){
                  if(
                  titleController.text.isNotEmpty &&
                      descriptionController.text.isNotEmpty &&
                      _date != null
                  ){
                    TaskController controller = Get.find();
                    TaskModel model = TaskModel(
                        title: titleController.text,
                        description: descriptionController.text,
                        date: _date!
                    );
                    controller.add(model);
                    Navigator.pop(context);
                  }
                },
                child: Text('Submit')
            )
          ],
        ),
      ),
    );
  }
}



