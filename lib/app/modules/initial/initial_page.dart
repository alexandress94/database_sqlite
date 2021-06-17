import 'package:database_sqlite/app/modules/initial/initial_controller.dart';
import 'package:database_sqlite/app/modules/initial/local_widgets/todo_datails_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'local_widgets/form_widget.dart';
import 'local_widgets/is_empty_widget.dart';

class InitialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _initialController = Get.find<InitialController>();
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 46, left: 16, right: 16),
            height: Get.height * 0.5,
            width: double.infinity,
            child: FormWidget(),
          ),
          Obx(() {
            if (_initialController.listTodoModels.isEmpty) {
              return IsEmptyWidget();
            } else {
              return TodoDatailsWidget();
            }
          }),
        ],
      ),
    );
  }
}
