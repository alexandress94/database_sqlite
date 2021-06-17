import 'package:database_sqlite/app/modules/initial/initial_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodoDatailsWidget extends StatelessWidget {
  const TodoDatailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _initialController = Get.find<InitialController>();
    return ListView.builder(
      itemCount: _initialController.listTodoModels.length,
      itemBuilder: (BuildContext context, int index) {
        var todos = _initialController.listTodoModels[index];
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              child: Text(''),
            ),
            title: Text('${todos.title}'),
            subtitle: Text('${todos.date}'),
          ),
        );
      },
    );
  }
}
