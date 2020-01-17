import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
class DatabaseTestPage extends StatelessWidget{


  final nameCon = new TextEditingController();

  get _dbPath async{
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path,'name.db');
    return directory.path;
  }

  Future<Database> get _localFile async {
    final path = await _dbPath;

    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {

          await db.execute(
              "CREATE TABLE user (id INTEGER PRIMARY KEY, name TEXT)");
        });
    return database;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }

}