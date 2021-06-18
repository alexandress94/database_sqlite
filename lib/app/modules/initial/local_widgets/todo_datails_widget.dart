import 'package:database_sqlite/app/modules/initial/initial_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'alert_dialog_widget.dart';

class TodoDatailsWidget extends StatelessWidget {
  const TodoDatailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _initialController = Get.find<InitialController>();

    _showAlertDialog({required BuildContext context, required todos}) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) {
          return AlertDialogWidget(
            todos: todos,
          );
        },
      );
    }

    return ListView.builder(
      itemCount: _initialController.listTodoModels.length,
      itemBuilder: (BuildContext context, int index) {
        var todos = _initialController.listTodoModels[index];
        return Card(
          key: ValueKey(todos.id),
          child: ListTile(
            leading: CircleAvatar(
              // Obtem a primeira letra digitada na descrição.
              // Altera para maiuscúlo primeira letra digitada.
              child: Text('${todos.title!.substring(0, 1).toUpperCase()}'),
            ),
            title: Text('${todos.title}'),
            subtitle: Text('${todos.date}'),
            onTap: () {
              _showAlertDialog(context: context, todos: todos);
              _initialController.textController.text = todos.title!;
              _initialController.selectedDate = todos.date!;
            },
          ),
        );
      },
    );
  }
}
