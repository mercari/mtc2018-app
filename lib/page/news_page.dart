import 'package:flutter/material.dart';
import '../colors.dart';

class NewsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("お知らせ"),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Card(
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
                                'Webページが公開されました',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    color: kMtcPrimaryGrey,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(height: 4.0),
                              Text('2018/08/29',
                                  style: TextStyle(
                                      fontSize: 12.0, color: kMtcPrimaryGrey))
                            ])
                      ],
                    ),
                    Container(height: 12.0),
                    Text("Mercari Tech Conf 2018のWebページが公開されました。",
                        style: TextStyle(color: kMtcPrimaryGrey)),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
