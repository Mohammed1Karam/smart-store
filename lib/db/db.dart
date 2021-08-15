import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
class DB  {
  static final DB _instance = DB._internal();
  late final Database _database;

  factory DB() {
    return _instance;
  }

  DB._internal();

  Database get database => _database;

  Future<void> initDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'app_database.sql');
    _database = await openDatabase(
      path,
      version: 1,
      onOpen: (Database db) {},
      onCreate: (Database db, int version) async {
        await db.execute('CREATE TABLE cart ('
            'user_id,'
            'id INTEGER,'
            'name_en TEXT,'
            'name_ar TEXT,'
            'info_en TEXT,'
            'info_ar TEXT,'
            'image_url TEXT,'
            'price NUMERIC,'
            'overall_rate NUMERIC,'
            'offer_price NUMERIC,'
            'quantity INTEGER,'
            'cart_quantity INTEGER'
            ')');
      },
      onUpgrade: (Database db, int oldVersion, int newVersion) {},
      onDowngrade: (Database db, int oldVersion, int newVersion) {},
    );
  }
}