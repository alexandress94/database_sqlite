import 'package:database_sqlite/app/data/models/todo_model.dart';
import 'package:database_sqlite/app/modules/initial/initial_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AlertDialogWidget extends StatelessWidget {
  final TodoModel todos;
  final _formKey = GlobalKey<FormState>();
  AlertDialogWidget({Key? key, required this.todos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _initialController = Get.find<InitialController>();

    _showDatePicker() {
      return showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime.now().subtract(Duration(days: 365)),
              lastDate: DateTime.now().add(Duration(days: 365)))
          .then(
        (date) {
          // Caso não seja selecionado nenhuma data, sairá da função.
          if (date == null) {
            return;
          }
          _initialController.selectedDate =
              DateFormat('dd/MM/yyy').format(date);
        },
      );
    }

    return AlertDialog(
      title: Text('Atualizar dados'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                textInputAction: TextInputAction.done,
                controller: _initialController.textController,
                keyboardType: TextInputType.name,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Digite uma descrição';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  icon: Icon(Icons.create),
                  hintText: todos.id.toString(),
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Selecione uma data'),
                  GetBuilder<InitialController>(
                    id: 'date',
                    builder: (controller) => TextButton.icon(
                      onPressed: _showDatePicker,
                      label: Text(controller.getSelectedDateFormat),
                      icon: Icon(Icons.arrow_drop_down),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton.icon(
                    icon: Icon(Icons.subdirectory_arrow_left),
                    label: Text('Sair'),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  ElevatedButton.icon(
                    icon: Icon(Icons.save),
                    label: Text('Salvar'),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _initialController.updateTodo(todos);
                        Get.back();
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
