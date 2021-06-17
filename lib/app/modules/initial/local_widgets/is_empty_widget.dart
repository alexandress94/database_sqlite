import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IsEmptyWidget extends StatelessWidget {
  const IsEmptyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
          child: Container(
        width: Get.width,
        height: Get.height,
        child: Center(
          child: Text('Nenhuma transação cadastrada!'),
        ),
      ),
    );
  }
}
