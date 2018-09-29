import "package:flutter/material.dart";
import "package:mtc2018_app/model/exhibition.dart";
import "package:mtc2018_app/colors.dart";
import "package:mtc2018_app/localize.dart";
import "package:mtc2018_app/repository/repository.dart";
import "dart:async";

class ContentPage extends StatefulWidget {
  final Repository repository;
  const ContentPage({Key key, this.repository}) : super(key: key);

  @override
  _ContentPageState createState() => new _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  List<Exhibition> _exhibitionList = [];

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() async {
    final exhibitionList = await widget.repository.getExhibitionList();
    setState(() {
      _exhibitionList = exhibitionList;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_exhibitionList.length == 0) {
      return Scaffold(
          appBar: AppBar(
            title: Text(MtcLocalizations.of(context).newsTitle),
            centerTitle: false,
          ),
          body: Center(
            child: CircularProgressIndicator(),
          ));
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(MtcLocalizations.of(context).newsTitle),
          centerTitle: false,
        ),
        body: RefreshIndicator(
          onRefresh: _handleRefresh,
          child: ListView(
            padding: EdgeInsets.all(16.0),
            children: _exhibitionList.map((exhibition) {
              Locale currentLocale = Localizations.localeOf(context);
              var message = currentLocale.languageCode == "ja"
                  ? exhibition.descriptionJa
                  : exhibition.description;
              return Card(
                  color: Colors.white,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
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
                                  Text(exhibition.title,
                                      style: TextStyle(
                                          fontSize: 12.0,
                                          color: kMtcPrimaryGrey))
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
        ));
  }

  Future<Null> _handleRefresh() async {
  final exhibitionList = await widget.repository.refreshExhibitionList();
    setState(() {
      _exhibitionList = exhibitionList;
    });
    return null;
  }
}