import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:money_management_app/models/category/category_model.dart';

const CATEGORY_DB_NAME = 'category_database';

abstract class categoryDBFunctions {
  Future<List<categoryModel>> getCategories();
  Future<void> insertCategory(categoryModel value);
  Future<void> deleteCategory(String CategoryID);
}

class categoryDB implements categoryDBFunctions {
  categoryDB._internal();
  static categoryDB instance = categoryDB._internal();
  factory categoryDB() {
    return instance;
  }

  ValueNotifier<List<categoryModel>> incomeCategoryListListener =
      ValueNotifier([]);
  ValueNotifier<List<categoryModel>> expenseCategoryListListener =
      ValueNotifier([]);
  @override
  Future<void> insertCategory(categoryModel value) async {
    final _categoryDB = await Hive.openBox<categoryModel>(CATEGORY_DB_NAME);
    await _categoryDB.put(value.id,value);
    refreshUI();
  }

  @override
  Future<List<categoryModel>> getCategories() async {
    final _categoryDB = await Hive.openBox<categoryModel>(CATEGORY_DB_NAME);
    return _categoryDB.values.toList();
  }

  Future<void> refreshUI() async {
    final _allCategories = await getCategories();
    incomeCategoryListListener.value.clear();
    expenseCategoryListListener.value.clear();
    await Future.forEach(
      _allCategories,
      (categoryModel category) {
        if (category.type == categoryType.income) {
          incomeCategoryListListener.value.add(category);
        } else {
          expenseCategoryListListener.value.add(category);
        }
      },
    );
    incomeCategoryListListener.notifyListeners();
    expenseCategoryListListener.notifyListeners();
  }

  @override
  Future<void> deleteCategory(String CategoryID) async {
    final _categoryDb = await Hive.openBox<categoryModel>(CATEGORY_DB_NAME);
    await _categoryDb.delete(CategoryID);
    refreshUI();
  }
}
