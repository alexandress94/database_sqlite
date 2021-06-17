import 'package:database_sqlite/app/data/models/todo_model.dart';
import 'package:database_sqlite/app/data/provider/database_helper.dart';

class TodoRepository{
  final DatabaseHelper instance;

  // DatabaseHelper _instance = DatabaseHelper.instance;

  TodoRepository({required this.instance});

  Future< List < Map < String, dynamic >>> query(  ) async {
    return await instance.query();
  }

  Future< int > insert( TodoModel todo ) async {
    return await instance.insert(todo);
  }

  Future< int > update( TodoModel todo ) async {
    return await instance.update(todo);
  }

  Future< int > delete( int id ) async {
    return await instance.delete( id );
  }
}