import 'package:database_sqlite/app/data/provider/database_helper.dart';
import 'package:database_sqlite/app/data/repository/todo_repository.dart';
import 'package:database_sqlite/app/modules/initial/initial_controller.dart';
import 'package:get/get.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut< InitialController >(
      () => InitialController(
        repository: TodoRepository(
          instance: DatabaseHelper.instance,
        ),
      ),
    );
  }
}
