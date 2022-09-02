// ignore_for_file: prefer_collection_literals

import '../model/category_model.dart';

List<CategoryModel> getCategories() {
  // ignore: deprecated_member_use
  List<CategoryModel> category = <CategoryModel>[];
  CategoryModel categoryModel = CategoryModel();

  //1

  categoryModel.categoryName = "Politics";
  categoryModel.imgUrl = "assets/politics_icon.png";
  category.add(categoryModel);
  categoryModel = CategoryModel();

  //2

  categoryModel.categoryName = "Politics";
  categoryModel.imgUrl = "assets/politics_icon.png";
  category.add(categoryModel);

  //3

  categoryModel.categoryName = "Politics";
  categoryModel.imgUrl = "assets/politics_icon.png";
  category.add(categoryModel);

  //4

  categoryModel.categoryName = "Politics";
  categoryModel.imgUrl = "assets/politics_icon.png";
  category.add(categoryModel);

  //5

  categoryModel.categoryName = "Politics";
  categoryModel.imgUrl = "assets/politics_icon.png";
  category.add(categoryModel);

  return category;
}
