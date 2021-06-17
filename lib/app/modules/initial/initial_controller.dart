import 'package:database_sqlite/app/data/models/todo_model.dart';
import 'package:database_sqlite/app/data/repository/todo_repository.dart';
import 'package:database_sqlite/app/modules/initial/local_widgets/todo_datails_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class InitialController extends GetxController{
  // Instância de variavéis.
  final TodoRepository repository;
  final TextEditingController textController  = TextEditingController(  );
  DateTime _dateTime                          = DateTime.now(  );
  RxList<TodoModel> listTodoModels            = <TodoModel>[  ].obs;
  // Contrutor
  InitialController( {required this.repository} );

  @override
  void onReady(  ){
    // Chamada do método.
    print('onReady');
    query(  );
    super.onReady(  );
  }

  set selectedDate( DateTime date ){
    _dateTime = date;
    update( ['date'] );
  }
  get getSelectedDateFormat =>  DateFormat( 'dd/MM/yyy' ).format( _dateTime );

  // Obtem todos os dados
  Future<void> query(  ) async{
    List<Map<String, dynamic>> todos = await repository.query();
    listTodoModels.value = todos.map((data) => TodoModel.fromMap(data)).toList();
  }

  // Inserir os dados
  Future<void> insert( ) async {
    await repository.insert(TodoModel(
      title: textController.text,
      date: getSelectedDateFormat
    ));
    // Limpa campo.
    clearField();
  }

  void clearField(  ){
    textController.text = "";
    _dateTime           = DateTime.now();
  }
}