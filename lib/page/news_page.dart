import 'package:flutter/material.dart';

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
              child: Container(
            padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.account_circle),
                    Container(width: 8.0),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'お知らせ1',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                          Container(height: 4.0),
                          Text('2018/10/1', style: TextStyle(fontSize: 12.0))
                        ])
                  ],
                ),
                Container(height: 12.0),
                Text("お知らせの内容が入ります。"),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
