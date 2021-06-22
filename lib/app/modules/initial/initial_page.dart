import 'package:database_sqlite/app/modules/initial/initial_controller.dart';
import 'package:database_sqlite/app/modules/initial/local_widgets/on_loading_widget.dart';
import 'package:database_sqlite/app/modules/initial/local_widgets/success_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'local_widgets/alert_dialog_widget.dart';
import 'local_widgets/on_empty_widget.dart';

class InitialPage extends GetView<InitialController> {
  const InitialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CRUD SQLite'),
      ),
      body: controller.obx(
        (state) => SuccessWidget(),
        onEmpty: OnEmptyWidget(),
        onLoading: OnLoadingWidget(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          controller.insert();
        },
      ),
    );
  }

  // _showDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext _) {
  //       return AlertDialogWidget(
  //         title: 'CADASTRAR',
  //         action: 'CONFIRMAR',
  //         close: 'VOLTAR',
  //         iconAction: Icons.add,
  //         iconClose: Icons.subdirectory_arrow_left,
  //         onPressed: (){
  //           controller.insert();
  //         },
  //       );
  //     },
  //   );
  // }
}
