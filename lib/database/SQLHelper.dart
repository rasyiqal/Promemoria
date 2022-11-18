import 'package:sqflite/sqflite.dart  ' as sql;

class SQLHelper {
  //fungsi create db
  static Future<void> createTables(sql.Database database) async {
    await database.execute("""
  CREATE TABLE USER(
    Id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    username TEXT,
    password TEXT,
    email TEXT,
  )
  """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase('user.db', version: 1,
        onCreate: (sql.Database database, int version) async {
      await createTables(database);
    });
  }

  //tambah database
  static Future<int> tambahUser(
      String username, String password, String email) async {
    final db = await SQLHelper.db();
    final data = {'username': username, 'password': password, 'email': email};
    return await db.insert('USER', data);
  }

  //get data
  static Future<List<Map<String, dynamic>>> getUser() async {
    final db = await SQLHelper.db();
    return db.query('USER');
  }
}
