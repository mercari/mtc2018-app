import 'package:flutter/material.dart';
import 'package:mtc2018_app/graphql/news.dart';
import 'package:mtc2018_app/colors.dart';
import 'package:mtc2018_app/graphql/client.dart';
import 'package:mtc2018_app/localize.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(MtcLocalizations.of(context).newsTitle),
        centerTitle: false,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: this.newsList.map((news) {
          Locale currentLocale = Localizations.localeOf(context);
          var message = currentLocale.languageCode == "ja"
              ? news.messageJa
              : news.message;
          return Card(
              color: Colors.white,
              child: Container(
                padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                message,
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
                    Text(message, style: TextStyle(color: kMtcPrimaryGrey)),
                  ],
                ),
              ));
        }).toList(),
      ),
    );
  }
}
