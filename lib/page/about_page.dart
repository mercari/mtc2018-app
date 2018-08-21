import 'package:flutter/material.dart';

var _horizontalSpace = 16.0;
var _sectionVertialSpace = 40.0;

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Container(
        padding: EdgeInsets.symmetric(
            vertical: _sectionVertialSpace, horizontal: _horizontalSpace),
        child: Text(
          "Mercari \nTech Conf.",
          style: TextStyle(fontSize: 60.0, fontWeight: FontWeight.w800),
        ),
      ),
      Container(
          padding: EdgeInsets.fromLTRB(
              _horizontalSpace, 0.0, _horizontalSpace, _sectionVertialSpace),
          child: Text(
            "Mercari Tech Conf はすごいカンファレンスです",
          )),
      Container(
          padding: EdgeInsets.fromLTRB(
              _horizontalSpace, 0.0, _horizontalSpace, 40.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("日時",
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600)),
            Container(height: _sectionVertialSpace / 2.0),
            Row(
              children: [
                Expanded(
                  child: Text("開催日"),
                  flex: 1,
                ),
                Expanded(child: Text("2018年10月4日(木)"), flex: 3)
              ],
            ),
            Container(height: _sectionVertialSpace / 2.0),
            Row(
              children: [
                Expanded(
                  child: Text("場所"),
                  flex: 1,
                ),
                Expanded(child: Text("森ビル六本木アカデミーヒルズ"), flex: 3)
              ],
            ),
            Container(height: _sectionVertialSpace / 2.0),
            Row(
              children: [
                Expanded(
                  child: Text("対象"),
                  flex: 1,
                ),
                Expanded(child: Text("メルカリを愛するエンジニア"), flex: 3)
              ],
            ),
            Container(height: _sectionVertialSpace / 2.0),
            Row(
              children: [
                Expanded(
                  child: Text("参加費"),
                  flex: 1,
                ),
                Expanded(child: Text("xx月xx日(x) 12:00〜 販売開始"), flex: 3)
              ],
            )
          ])),
      Container(
          padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, _sectionVertialSpace),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: _horizontalSpace),
                child: Text("場所",
                    style: TextStyle(
                        fontSize: 24.0, fontWeight: FontWeight.w600))),
            Container(height: _sectionVertialSpace / 2.0),
            Image.asset("images/map_tmp.png")
          ])),
      Container(
          padding: EdgeInsets.fromLTRB(
              _horizontalSpace, 0.0, _horizontalSpace, _sectionVertialSpace),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("電車でお越しの方",
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600)),
            Container(height: _sectionVertialSpace / 2.0),
            Text("六本木からxxxx")
          ])),
      Container(
          padding: EdgeInsets.fromLTRB(
              _horizontalSpace, 0.0, _horizontalSpace, _sectionVertialSpace),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("車でお越しの方",
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600)),
            Container(height: _sectionVertialSpace / 2.0),
            Text("駐車場がxxxx")
          ]))
    ]);
  }
}
