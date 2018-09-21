import 'package:flutter/material.dart';
import 'package:mtc2018_app/graphql/news.dart';
import '../colors.dart';
import 'package:mtc2018_app/graphql/client.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({Key key}) : super(key: key);

  @override
  _NewsPageState createState() => new _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List<News> newsList = [];

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() async {
    var client = Client();
    var news = await client.fetchNews();
    setState(() {
      this.newsList = news;
    });

    var sessions = await client.fetchSessions();
    print(sessions);

    sessions.forEach((s) {
      print(s.title);
      print(s.tags);
      print(s.lang);
      print(s.type);
      print(s.place);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("お知らせ"),
        centerTitle: false,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: this
            .newsList
            .map((news) => Card(
                color: Colors.white,
                child: Container(
                  padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          // Icon(Icons.account_circle),
                          // Container(width: 8.0),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  news.messageJa,
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: kMtcPrimaryGrey,
                                      fontWeight: FontWeight.bold),
                                ),
                                Container(height: 4.0),
                                Text(news.date,
                                    style: TextStyle(
                                        fontSize: 12.0, color: kMtcPrimaryGrey))
                              ])
                        ],
                      ),
                      Container(height: 12.0),
                      Text(news.messageJa,
                          style: TextStyle(color: kMtcPrimaryGrey)),
                    ],
                  ),
                )))
            .toList(),
      ),
    );
  }
}
