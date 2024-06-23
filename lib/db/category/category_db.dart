import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_management_app/models/category/category_model.dart';

const CATEGORY_DB_NAME = 'category_database';

abstract class categoryDBFunctions {
  Future<List<categoryModel>> getCategories();
  Future<void> insertCategory(categoryModel value);
}

class categoryDB implements categoryDBFunctions {
  @override
  Future<void> insertCategory(categoryModel value) async {
    final _categoryDB = await Hive.openBox<categoryModel>(CATEGORY_DB_NAME);
    await _categoryDB.add(value);
  }

  @override
  Future<List<categoryModel>> getCategories() async {
    final _categoryDB = await Hive.openBox<categoryModel>(CATEGORY_DB_NAME);
    return _categoryDB.values.toList();
  }
}
