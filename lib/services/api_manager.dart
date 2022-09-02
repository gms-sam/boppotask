import 'dart:convert';

import 'package:boppotask/model/api_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class News {
  List<Newsmodel> news = [];

  Future<void> getNews() async {
    String url =
        "http://newsapi.org/v2/top-headlines?country=in&excludeDomains=stackoverflow.com&sortBy=publishedAt&language=en&apiKey=b41ac1fca4ba48f5b68057321b37c7ce";
    Uri uri = Uri.parse(url);
    var response = await http.get(uri);
    var jsonData = jsonDecode(response.body);
    if (jsonData["status"]=="ok") {
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null&&element["author"]!=null&&element["urlToImage"]!=null) {
          Newsmodel newsmodel = Newsmodel(
            author: element["author"],
            title: element["title"],
            content: element["content"],
            description: element["description"],
          //  publishedAt: element["publishedAt"],
            url: element["url"],
            urlToImage: element["urlToImage"],
          );
          news.add(newsmodel);
        }
      });
    }
  }
}




/* import 'package:boppotask/model/api_model.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  final String baseUrl =
      "https://newsapi.org/v2/everything?q=tesla&from=2022-07-31&sortBy=publishedAt&apiKey=b41ac1fca4ba48f5b68057321b37c7ce";
  Future getNews(String newsCategory) async {
    Uri uri = Uri.parse(baseUrl);
    Newsmodel? newsModel;
    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        newsModel = Newsmodel.fromJson(response.body);
        print(response.body);
        return newsModel;
      } else {
        throw "error";
      }
    } catch (e) {
      rethrow;
    }
  }
}
 */
