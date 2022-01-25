import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:ukur_test/models/product_model.dart';

class ProductDatabaseHelper {
  static Database? _productDb;
  static ProductDatabaseHelper? _productDatabaseHelper;

  String table = 'productTable';
  String colId = 'id';
  String colName = 'name';
  String colDescription = "description";
  String colPrice = "price";
  String colImage = 'image';
  ProductDatabaseHelper._createInstance();

  static final ProductDatabaseHelper db =
      ProductDatabaseHelper._createInstance();

  factory ProductDatabaseHelper() {
    _productDatabaseHelper ??= ProductDatabaseHelper._createInstance();
    return _productDatabaseHelper!;
  }

  Future<Database> get database async {
    _productDb ??= await initializeDatabase();
    return _productDb!;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'products.db';
    var myDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
    return myDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute("CREATE TABLE $table"
        "($colId INTEGER PRIMARY KEY AUTOINCREMENT,"
        "$colName TEXT, $colDescription TEXT, $colPrice TEXT, $colImage TEXT)");
  }

  Future<List<Map<String, dynamic>>> getProductMapList() async {
    Database db = await database;
    var result = await db.query(table, orderBy: "$colId ASC");
    return result;
  }

  Future<List<Map<String, dynamic>>> getProductMapListById(int id) async {
    Database db = await database;
    var result = await db.query(table,
        where: '$colId = ?', whereArgs: [id], orderBy: "$colId ASC");
    return result;
  }

  Future<int> insertProduct(Product product) async {
    // print(cart);
    Database db = await database;
    var result = await db.insert(table, product.toMap());
    print(result);
    return result;
  }

  Future<int> updateProduct(Product product) async {
    // print("updating task ${task.id} ${task.name} current status ${task.completed}");
    var db = await database;
    var result = await db.update(table, product.toMap(),
        where: '$colId = ?', whereArgs: [product.id]);
    return result;
  }

  Future<int> deleteProduct(int id) async {
    // print("Deleting Product with id: $id ");
    var db = await database;
    int result = await db.delete(table, where: '$colId = ?', whereArgs: [id]);
    // print("Delete result: $result");
    return result;
  }

  Future<int> getCount(tableName) async {
    Database db = await database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) from $tableName');
    int? result = Sqflite.firstIntValue(x);
    return result!;
  }

  Future<List<Product>> getProductList() async {
    var productMapList = await getProductMapList();
    int count = await getCount(table);

    List<Product> productList = <Product>[];
    for (int i = 0; i < count; i++) {
      productList.add(Product.fromMap(productMapList[i]));
    }
    return productList;
  }

  Future<Product> getProductListById(int id) async {
    var product = await getProductMapListById(id);

    Product productData = Product();

    productData = Product.fromMap(product[0]);

    return productData;
  }

  close() async {
    var db = await database;
    var result = db.close();
    return result;
  }
}
