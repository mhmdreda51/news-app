import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp/model/newsinfo.dart';

class FetchApi {
  Future<List<NewsModel>> fetchNews() async {
    http.Response response = await http.get(
        "http://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=95c9cf9518ad4b2ab48e7a8fdad3519c");
        if(response.statusCode==200){
          var body = jsonDecode(response.body);
          List <NewsModel>news=[];
          for(var item in body){
            news.add(NewsModel.fromJson(item));
          }
          return news;
        }
        return null ;
  }
}
