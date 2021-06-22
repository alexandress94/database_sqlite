import 'package:database_sqlite/app/modules/initial/initial_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'alert_dialog_widget.dart';

class SuccessWidget extends StatelessWidget {
  final _initialController = Get.find<InitialController>();

  SuccessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        itemCount: _initialController.listTodoModels.length,
        itemBuilder: (BuildContext _, int index) {
          var todos = _initialController.listTodoModels[index];

          return Card(
            key: ValueKey(todos.id),
            child: ListTile(
              leading: CircleAvatar(
                child: Text(
                  todos.title!.substring(0, 1).toUpperCase(),
                ),
              ),
              onTap: () {
                _initialController.selectedIndex        = todos.id!;
                _initialController.textController.text  = todos.title!;
                _initialController.selectedDate         = todos.date!;

                _showDialog(context);
              },
              title: Text(todos.title!),
              subtitle: Text(todos.date!),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () async {
                  await _initialController.delete(todos.id!);
                },
              ),
            ),
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
          onPressed: () async {
            await _initialController.updateTodo();
            Get.back();
          },
        );
      },
    );
  }
}
