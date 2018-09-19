import 'package:flutter/material.dart';
import '../colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io' show Platform;

var _horizontalSpace = 24.0;

var boxDecoration = BoxDecoration(
    color: kMtcAboutSectionBackgroundGrey,
    borderRadius: BorderRadius.circular(8.0));

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Container(
        padding: EdgeInsets.fromLTRB(88.0, 72.0, 88.0, 56.0),
        child: Image.asset('images/about_logo.png'),
      ),
      Container(
          padding: EdgeInsets.fromLTRB(
              _horizontalSpace, 0.0, _horizontalSpace, 32.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "ABOUT",
              style: TextStyle(fontSize: 20.0),
            ),
            Container(height: 8.0),
            Container(
                decoration: boxDecoration,
                padding: EdgeInsets.all(24.0),
                child: Text(
                    "「Mercari Tech Conf」は、株式会社メルカリをはじめとするメルカリグループ各社が、これから目指す方向や、これから取り組む技術的なチャレンジについてご紹介するエンジニア向けの技術カンファレンスです。",
                    style: TextStyle(height: 1.2)))
          ])),
      Container(
          padding: EdgeInsets.fromLTRB(
              _horizontalSpace, 0.0, _horizontalSpace, 32.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "ACCESS",
              style: TextStyle(fontSize: 20.0),
            ),
            Container(height: 8.0),
            Container(
                decoration: boxDecoration,
                padding: EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("六本木アカデミーヒルズ",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Container(height: 16.0),
                    Text("〒106-0032\n東京都港区六本木６丁目１０ 六本木6−10−1 森タワー49階"),
                    FlatButton(
                      padding:
                          EdgeInsets.symmetric(vertical: 16.0, horizontal: 0.0),
                      onPressed: () async {
                        // Android
                        var url =
                            'geo:35.6604311,139.7287178?z=10&q=%e5%85%ad%e6%9c%ac%e6%9c%a8%e3%82%a2%e3%82%ab%e3%83%87%e3%83%9f%e3%83%bc%e3%83%92%e3%83%ab%e3%82%ba';
                        if (Platform.isIOS) {
                          // iOS
                          url =
                              'http://maps.apple.com/?sll=35.6604311,139.7287178&z=10&q=%e5%85%ad%e6%9c%ac%e6%9c%a8%e3%82%a2%e3%82%ab%e3%83%87%e3%83%9f%e3%83%bc%e3%83%92%e3%83%ab%e3%82%ba';
                        }
                        if (await canLaunch(url)) {
                          await launch(url);
                        }
                      },
                      child: Text("マップを開く",
                          style: TextStyle(
                              color: kMtcSecondaryRed,
                              decoration: TextDecoration.underline)),
                    ),
                  ],
                )),
          ])),
      Container(
          padding: EdgeInsets.fromLTRB(
              _horizontalSpace, 0.0, _horizontalSpace, 40.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("電車でお越しの方",
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold)),
            Container(height: 16.0),
            Text(
                "東京メトロ 日比谷線「六本木」駅1C出口より徒歩3分（コンコースにて直結）\n都営地下鉄 大江戸線「六本木」駅3出口より徒歩6分",
                style: TextStyle(fontSize: 12.0)),
          ])),
      Container(
          padding: EdgeInsets.fromLTRB(
              _horizontalSpace, 0.0, _horizontalSpace, 32.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("バスでお越しの方",
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold)),
            Container(height: 16.0),
            Text("渋谷駅より",
                style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold)),
            Container(height: 8.0),
            Text(
                "都バス都RH01系統【渋谷駅前⇔六本木ヒルズ】／「六本木ヒルズ」「六本木ヒルズけやき坂」下車（約15分）\n都バス 都01系統【渋谷駅前⇔新橋駅前】／「EXシアター六本木前」下車（約14分）",
                style: TextStyle(fontSize: 12.0)),
            Container(height: 16.0),
            Text("新宿駅より",
                style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold)),
            Container(height: 8.0),
            Text("都バス 都01系統【新橋駅前⇔渋谷駅前 】／「EXシアター六本木前」下車（約16分）",
                style: TextStyle(fontSize: 12.0)),
          ])),
      Container(
          padding: EdgeInsets.fromLTRB(
              _horizontalSpace, 0.0, _horizontalSpace, 32.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
                width: double.infinity,
                decoration: boxDecoration,
                padding: EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("アカデミーヒルズまでのアクセス",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    FlatButton(
                      padding:
                          EdgeInsets.symmetric(vertical: 16.0, horizontal: 0.0),
                      onPressed: () async {
                        var url =
                            "http://forum.academyhills.com/roppongi/access/index.html";
                        if (await canLaunch(url)) {
                          await launch(url);
                        }
                      },
                      child: Text("アカデミーヒルズ公式サイトへ",
                          style: TextStyle(
                              fontSize: 12.0,
                              color: kMtcSecondaryRed,
                              decoration: TextDecoration.underline)),
                    ),
                  ],
                )),
          ])),
    ]);
  }
}
