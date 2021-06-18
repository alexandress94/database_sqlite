import 'package:database_sqlite/app/modules/initial/initial_controller.dart';
import 'package:database_sqlite/app/modules/initial/local_widgets/form_widget.dart';
import 'package:database_sqlite/app/modules/initial/local_widgets/is_empty_widget.dart';
import 'package:database_sqlite/app/modules/initial/local_widgets/todo_datails_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InitialPage extends StatelessWidget {
  InitialPage({Key? key}) : super(key: key);

  final _initialController = Get.find<InitialController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CRUD SQLite'),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: FormWidget(),
          ),
          Obx(() {
            if (_initialController.listTodoModels.isEmpty) {
              return IsEmptyWidget();
            } else {
              return Expanded(
                flex: 2,
                child: TodoDatailsWidget(),
              );
            }
          })
        ],
      ),
    );
  }
}
