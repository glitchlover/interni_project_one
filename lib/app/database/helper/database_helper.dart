import 'package:get/get.dart';
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';

import 'package:interni_project_one/app/database/model/user_model.dart';

class DatabaseHelper {
  final String _tableName = "user";
  Database? db;
  // ...
  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    if (path.isEmpty) path.createPath();
    db = await openDatabase(
      p.join(path, _tableName),
      onCreate: (database, version) async {
        await database.execute(
          """
            CREATE TABLE $_tableName (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              userName TEXT NOT NULL,
              firstName TEXT NOT NULL,
              lastName TEXT NOT NULL,
              email TEXT NOT NULL,
              password TEXT NOT NULL
            )
          """,
        );
      },
      version: 1,
    );
    return db!;
  }

// ...
// CRUD operations
  Future<int> insert(UserModel user) async {
    return db!.insert(_tableName, user.toMap());
  }

  Future<int> update(UserModel user) async {
    return await db!.update(
      _tableName,
      user.toMap(),
      where: 'userName = ?',
      whereArgs: [user.userName],
    );
  }

  Future<int> delete(String userName) async {
    return await db!.delete(
      _tableName,
      where: 'userName = ?',
      whereArgs: [userName],
    );
  }

  Future<List<UserModel>> getAllUsers() async {
    final List<Map<String, dynamic>> maps = await db!.query(_tableName);
    return maps.map((map) => UserModel.fromMap(map)).toList();
  }

  Future<UserModel?> getUserById(int id) async {
    final List<Map<String, dynamic>> maps = await db!.query(
      _tableName,
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return UserModel.fromMap(maps.first);
    }

    return null; // Return null if no user is found with the given id
  }
  Future<UserModel?> loginUser(String usernameOrEmail, String password) async {
    final List<Map<String, dynamic>> maps = await db!.query(
      _tableName,
      where: 'userName = ? OR email = ?',
      whereArgs: [usernameOrEmail, usernameOrEmail],
    );
    if (maps.isNotEmpty) {
      for (var map in maps) {
        if (map['password'] == password) {
          return UserModel.fromMap(map);
        }
      }
    }
    return null; // User not found or password incorrect
  }

  Future<String> generateUniqueUsername(
      String firstName, String lastName) async {
    String username = '${firstName.toLowerCase()}${lastName.toLowerCase()}';
    int? count = Sqflite.firstIntValue(await db!.rawQuery(
        'SELECT COUNT(*) FROM $_tableName WHERE userName = ?', [username]));

    if (count == 0) {
      print(count);
      return username;
    } else {
      int suffix = 1;
      String newUsername;
      do {
        newUsername = '$username$suffix';
        count = Sqflite.firstIntValue(await db!.rawQuery(
            'SELECT COUNT(*) FROM $_tableName WHERE userName = ?',
            [newUsername]));
        suffix++;
      } while (count != 0);
      return newUsername;
    }
  }

  Future<bool> doesUserExist(String email) async {
    final List<Map<String, dynamic>> maps = await db!.query(
      _tableName,
      where: 'email = ?',
      whereArgs: [email],
    );
    print(email);
    print(maps);
    return maps.isNotEmpty;
  }

  Future close() async {
    await db!.close();
  }
}
