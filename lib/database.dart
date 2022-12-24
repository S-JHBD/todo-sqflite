import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DataModel {
  int id;
  String? title;
  DataModel({required this.id, this.title});

  factory DataModel.fromMap(Map<String, dynamic> json) => DataModel(
      id: json['id'], title: json['title']);

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
  };
}

class NewDatabase {

    initDB() async {
      var databasePath = await getDatabasesPath();
      String path = join(databasePath, 'demo.db');

      var database = await openDatabase(
          path, version: 1, onCreate: createDatabase);
      return database;
    }
      createDatabase(Database database, int version) async {
      await database.execute(
          'CREATE TABLE todo (id INTEGER PRIMARY KEY, title TEXT NOT NULL)');
      }

  Future<bool> insertData(DataModel dataModel) async {
    final Database database = await initDB();
    database.insert("todo", dataModel.toMap());
    return true;
  }

  Future<List<DataModel>> getData() async {
    final Database database = await initDB();
    final List<Map<String, Object?>> data = await database.query("todo");
    return data.map((e) => DataModel.fromMap(e)).toList();
  }

  Future<bool> update(DataModel dataModel, int id) async {
    final Database database = await initDB();
    await database.update("todo", dataModel.toMap(), where: "id=?", whereArgs: [id]);
    return true;
  }

  Future<void> delete(int id) async {
    final Database database = await initDB();
    await database.delete("todo", where: "id=?", whereArgs: [id]);
  }

}
