import 'package:database_sqlite/app/data/models/todo_model.dart';
import 'package:database_sqlite/app/modules/initial/initial_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'alert_dialog_widget.dart';

class SuccessWidget extends StatelessWidget {
  SuccessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _initialController = Get.find<InitialController>();
    // List<int?> _listIdTodos() {
    //   List<int?> todos = [];
    //   for (var item = 0; item < state.length; item++) {
    //     todos.add(state[item].id);
    //   }
    //   return todos;
    // }

    return Obx(
      () => ListView.builder(
        itemCount: _initialController.listTodoModels.length,
        itemBuilder: (_, index) {
          var todos = _initialController.listTodoModels[index];
          return Text(
            '${todos.title}',
            style: TextStyle(color: Colors.black),
          );
        },
      ),
    );
  }

  // _showDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext _) {
  //       return AlertDialogWidget(
  //         title: 'EDITAR',
  //         action: 'SALVAR',
  //         close: 'SAIR',
  //         iconAction: Icons.save,
  //         iconClose: Icons.close,
  //         onPressed: () {
  //           _initialController.updateTodo();
  //         },
  //       );
  //     },
  //   );
  // }
}
