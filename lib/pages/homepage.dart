import 'package:flutter/material.dart';
import 'package:newsapp/model/newsinfo.dart';
import 'package:newsapp/services/api_manger.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    FetchApi fetchApi = FetchApi();

    return Scaffold(
      appBar: AppBar(
        title: Text('News App'),
      ),
      body: Container(
        child: FutureBuilder(
          future: fetchApi.fetchNews(),
          builder: (context, snapshot) {
            return ListView.builder(
                itemCount: snapshot.data.articles.length,
                itemBuilder: (context, index) {
                  var article = snapshot.data.articles[index];
                  return Text(
                    article.description,
                  );
                });
          },
        ),
      ),
    );
  }
}
