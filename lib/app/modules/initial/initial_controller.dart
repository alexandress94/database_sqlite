import 'package:database_sqlite/app/data/models/todo_model.dart';
import 'package:database_sqlite/app/data/repository/todo_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class InitialController extends GetxController
    with StateMixin<List<TodoModel>> {
  // Instância de variavéis.
  final TodoRepository repository;
  late int selectedIndex;
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

  // setando a data selecionada.
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
    // Exibe widget de carregamento
    change([], status: RxStatus.loading());
    // obtendo os dados da instância da sentença
    List<Map<String, dynamic>> todos = await repository.query();
    // percorre os dados obtidos e adiciona o valor ao "listTodoModels"
    listTodoModels.value =
        todos.map((data) => TodoModel.fromMap(data)).toList();
    // Se "listTodoModels" for vazio, exibe um widget personalizado
    // Caso não seja vazio exibe um widget com as listas.
    listTodoModels.isEmpty
        ? change([], status: RxStatus.empty())
        : change([], status: RxStatus.success());
  }

  // Inserir os dados
  Future<void> insert() async {
    await repository.insert(
      TodoModel(title: textController.text, date: getSelectedDateFormat),
    );
    // Chamando o método query para atualizar a lista "listTodoModels"
    query();

    // Método para limpar campo.
    clearField();
  }

  // Atualiza um dado da lista.
  Future<void> updateTodo() async {
    TodoModel todo = TodoModel(
      id: selectedIndex,
      title: textController.text,
      date: getSelectedDateFormat,
    );
    await repository.update(todo);
    // Chamando o método query para atualizar a lista "listTodoModels"
    query();
  }

  Future<void> delete(int id) async {
    await repository.delete(id);
    query();
  }

  // Limpa os campos.
  void clearField() {
    textController.text = "";
    selectedDate = dateTimeNow;
  }
}
