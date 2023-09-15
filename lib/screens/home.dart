import 'package:flutter/material.dart';
import 'package:flutter_app09/logic/controller.dart';
import 'package:flutter_app09/screens/search.dart';
import 'package:get/get.dart';
import 'package:flutter_app09/widgets/taskview.dart';

class HomeScreen extends StatelessWidget {
  static final TaskController controller = Get.put(TaskController());
  bool showImage = true; // Add a boolean variable to control the image visibility.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo'),
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: Icon(Icons.list),
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: Mydelgate(),
              );
            },
          ),
        ],
      ),
      body: GetBuilder<TaskController>(
        init: controller,
        builder: (controller) {
          if (controller.tasks.isNotEmpty) {
            // Check if tasks are available, and hide the image.
            showImage = false;
          }
          return Column(
            children: [
              if (showImage) // Render the image conditionally.
                Image.asset(
                  'images/ops.jpg', // Replace with your image asset path.
                  width: 200,
                  height: 200,
                ),
              Expanded(
                child: ListView.separated(
                  itemCount: controller.tasks.length,
                  itemBuilder: (context, i) => TaskView(controller.tasks[i]),
                  separatorBuilder: (context, i) => Divider(
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          );
        },
      ),
      drawer: Drawer(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_task),
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
      ),
    );
  }
}