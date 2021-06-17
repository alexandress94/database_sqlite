import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../initial_controller.dart';

class FormWidget extends StatelessWidget {
  const FormWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
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
          _initialController.selectedDate = date;
        },
      );
    }

    return Form(
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
              hintText: 'Descrição',
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
          GetBuilder<InitialController>(
            builder: (controller) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.clear_outlined),
                  label: Text('Limpar'),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      controller.insert();
                    }
                  },
                  icon: Icon(Icons.save),
                  label: Text('Salvar'),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}