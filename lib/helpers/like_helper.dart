import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../moduls/food.dart';

Database? db;

class FoodLikeHelper {
  FoodLikeHelper._();
  static final FoodLikeHelper foodLikeHelper = FoodLikeHelper._();

  Future<Database?> initDB() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'food_like_database.db');

    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await db.execute(
              'CREATE TABLE FoodLike (id INTEGER , photo TEXT, name TEXT, price INTEGER, quantity INTEGER, actualPrice INTEGER);');
        });

    return db!;
  }

  Future<int> insertData({
    required int id,
    required Food food,
  }) async {
    db = await initDB();

    String query =
        "INSERT INTO FoodLike (id, photo, name, price, quantity, actualPrice) VALUES(?, ?, ?, ?, ?, ?);";

    List args = [
      id,
      food.photo,
      food.name,
      food.price,
      food.quantity,
      food.actualPrice
    ];

    return await db!.rawInsert(query, args);
  }

  Future<List<Map<String, Object?>>> fetchAllData() async {
    db = await initDB();

    String query = "SELECT * FROM FoodLike;";

    List<Map<String, Object?>> foodAllList = await db!.rawQuery(query);

    return foodAllList;
  }

  Future<int> deleteData({required String photo, required int price}) async {
    db = await initDB();

    String query = "DELETE FROM FoodLike WHERE photo= ? AND price = ?;";

    List args = [photo, price];

    return await db!.rawDelete(query, args);
  }
}