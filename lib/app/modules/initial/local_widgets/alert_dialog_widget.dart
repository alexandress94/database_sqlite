import 'package:database_sqlite/app/modules/initial/initial_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AlertDialogWidget extends StatelessWidget {
  final _initialController = Get.find<InitialController>();
  final _keyForm = GlobalKey<FormState>();
  final String title;
  final String action;
  final String close;
  final IconData iconAction;
  final IconData iconClose;
  final Function() onPressed;

  AlertDialogWidget({
    Key? key,
    required this.title,
    required this.action,
    required this.close,
    required this.iconAction,
    required this.iconClose,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: SingleChildScrollView(
        child: Form(
          key: _keyForm,
          child: Column(
            children: [
              TextFormField(
                controller: _initialController.textController,
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Descrição',
                  icon: Icon(Icons.create),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Digite uma descrição';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Data'),
                  GetBuilder<InitialController>(
                    id: 'date',
                    builder: (controller) {
                      return TextButton.icon(
                        onPressed: () {
                          _showDatePicker(context);
                        },
                        icon: Icon(Icons.arrow_drop_down),
                        label: Text(controller.getSelectedDateFormat),
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton.icon(
                    icon: Icon(
                      iconClose,
                      color: Colors.red[300],
                    ),
                    label: Text(
                      close,
                    ),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  TextButton.icon(
                    icon: Icon(
                      iconAction,
                      color: Colors.green[300],
                    ),
                    label: Text(action),
                    onPressed: () {
                      if (_keyForm.currentState!.validate()) onPressed();
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

  // Exibir o calendário
  _showDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(Duration(days: 365)),
      lastDate: DateTime.now(),
    ).then((date) {
      if (date == null) {
        return;
      }
      _initialController.selectedDate = DateFormat('dd/MM/yyy').format(date);
    });
  }
}
