import 'package:database_sqlite/app/data/models/todo_model.dart';
import 'package:database_sqlite/app/modules/initial/initial_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TodoDatailsWidget extends StatelessWidget {
  const TodoDatailsWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // final _initialController = Get.find<InitialController>();

    TodoModel listTodos = TodoModel();
    return Expanded(
      child: Container(
        width: Get.width,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Card(
                elevation: 5,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${listTodos.title}',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                '${listTodos.date}',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.create),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.delete),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
