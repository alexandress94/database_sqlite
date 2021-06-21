import 'package:database_sqlite/app/data/models/todo_model.dart';
import 'package:database_sqlite/app/data/repository/todo_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class InitialController extends GetxController
    with StateMixin<List<TodoModel>> {
  // Instância de variavéis.
  final TodoRepository repository;
  final textController = TextEditingController();
  String _dateTime = DateFormat('dd/MM/yyy').format(DateTime.now());
  RxList<TodoModel> listTodoModels = <TodoModel>[].obs;
  // Contrutor
  InitialController({required this.repository});

  @override
  void onReady() {
    // Chamada do método para rebuildar a página
    query();
    super.onReady();
  }

  set selectedDate(String date) {
    _dateTime = date;
    update(['date']);
  }

  // Obtendo data atual com formatação "dd/mm/yyyy"
  String get dateTimeNow => DateFormat('dd/MM/yyy').format(DateTime.now());

  // Obtendo data selecionada pelo usuário.
  String get getSelectedDateFormat => _dateTime;

  // Obtem todos os dados
  Future<void> query() async {
    // Status de carregamento
    change([], status: RxStatus.loading());
    List<Map<String, dynamic>> todos = await repository.query();
    if (listTodoModels.isEmpty) {
      // Se TodoModel for vazio
      change([], status: RxStatus.empty());
    } else {
      listTodoModels.value =
          todos.map((data) => TodoModel.fromMap(data)).toList();
      change([], status: RxStatus.success());
    }
  }

  // Inserir os dados
  Future<void> insert() async {
    await repository.insert(
        TodoModel(title: textController.text, date: getSelectedDateFormat));
    // Chamando o método query para atualizar a lista "listTodoModels"
    query();
    // Método para limpar campo.
    clearField();
  }

  // Atualiza os dados.
  Future<void> updateTodo(TodoModel todo) async {
    // Opcional
    await repository.update(todo);
    query();
  }

  void clearField() {
    // Limpa os campos.
    textController.text = "";
    selectedDate = dateTimeNow;
  }
}
