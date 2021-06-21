import 'package:database_sqlite/app/data/models/todo_model.dart';
import 'package:database_sqlite/app/modules/initial/initial_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'alert_dialog_widget.dart';

class SuccessWidget extends StatelessWidget {
  final _initialController = Get.find<InitialController>();
  final List<TodoModel> state;
  SuccessWidget({Key? key, required this.state}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<int?> _listIdTodos() {
      List<int?> todos = [];
      for (var item = 0; item < state.length; item++) {
        todos.add(state[item].id);
      }
      return todos;
    }

    return Card(
      key: ValueKey(_listIdTodos()),
      elevation: 5.0,
      child: ListView.builder(
        itemCount: state.length,
        itemBuilder: (BuildContext _, int index) {
          TodoModel todos = state[index];
          return ListTile(
            onTap: () {
              if (state.isNotEmpty) {
                _showDialog(context);
              }
            },
            leading: CircleAvatar(
              child: Text(todos.title!.substring(0, 1).toUpperCase()),
            ),
            title: Text(todos.title.toString()),
            subtitle: Text(todos.date.toString()),
            trailing: IconButton(onPressed: () {
              _initialController.updateTodo(todos);
            }, icon: Icon(Icons.delete)),
          );
        },
      ),
    );
  }

  _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext _) {
        return AlertDialogWidget(
          title: 'EDITAR',
          action: 'SALVAR',
          close: 'SAIR',
          iconAction: Icons.save,
          iconClose: Icons.close,
          onPressed: () {
            _initialController.updateTodo();
          },
        );
      },
    );
  }
}
