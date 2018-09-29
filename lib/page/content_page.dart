import "package:flutter/material.dart";
import "package:mtc2018_app/model/exhibition.dart";
import "package:mtc2018_app/colors.dart";
import "package:mtc2018_app/repository/repository.dart";
import "dart:async";

class ContentPage extends StatefulWidget {
  final Repository repository;

  const ContentPage({Key key, this.repository}) : super(key: key);

  @override
  _ContentPageState createState() => _ContentPageState();
}

class _ContentPageState extends State<ContentPage> {
  List<Exhibition> _exhibitionList = [];

  @override
  void initState() {
    super.initState();
    _loadExhibitionList();
  }

  @override
  Widget build(BuildContext context) {
    if (_exhibitionList.length == 0) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    var boothAExhibitions = _exhibitionList.where((e) => e.place == "BoothA");
    var boothBExhibitions = _exhibitionList.where((e) => e.place == "BoothB");

    return Container(
        child: DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: TabBar(
                tabs: [Tab(text: "BOOTH A"), Tab(text: "BOOTH B")],
                labelColor: kMtcSecondaryRed,
                indicatorColor: kMtcSecondaryRed,
              ),
              body: TabBarView(
                children: [
                  RefreshIndicator(
                      onRefresh: _handleRefresh,
                      child: ListView(
                          padding: EdgeInsets.all(16.0),
                          children: boothAExhibitions.map((exhibition) {
                            return _buildExhbiitionCard(context, exhibition);
                          }).toList())),
                  RefreshIndicator(
                      onRefresh: _handleRefresh,
                      child: ListView(
                          padding: EdgeInsets.all(16.0),
                          children: boothBExhibitions.map((exhibition) {
                            return _buildExhbiitionCard(context, exhibition);
                          }).toList())),
                ],
              ),
            )));
  }

  Widget _buildExhbiitionCard(BuildContext context, Exhibition exhibition) {
    Locale currentLocale = Localizations.localeOf(context);
    var title = currentLocale.languageCode == "ja"
        ? exhibition.titleJa
        : exhibition.title;
    var description = currentLocale.languageCode == "ja"
        ? exhibition.descriptionJa
        : exhibition.description;

    Widget image;
    if (exhibition.exhibitionImage != "") {
      image = ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4.0), topRight: Radius.circular(4.0)),
          child: Image.asset("images/" + exhibition.exhibitionImage));
    }

    return Card(
        color: Colors.white,
        child: FlatButton(
            onPressed: () {},
            padding: EdgeInsets.all(0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                image != null ? image : Container(),
                Container(
                    padding: const EdgeInsets.only(
                        top: 16.0, left: 20.0, right: 20.0),
                    child: Container(
                        margin: const EdgeInsets.only(bottom: 10.0),
                        child: Text(title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25.0,
                                color: Colors.black)))),
                Container(
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Container(
                        margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                        child: Text(description,
                            style: TextStyle(color: Colors.black))))
              ],
            )));
  }

  void _loadExhibitionList() async {
    final exhibitionList = await widget.repository.getExhibitionList();
    exhibitionList.forEach((e) {
      print(e.toJson());
    });
    setState(() {
      _exhibitionList = exhibitionList;
    });
  }

  Future<Null> _handleRefresh() async {
    final exhibitionList = await widget.repository.refreshExhibitionList();
    setState(() {
      _exhibitionList = exhibitionList;
    });
  }
}
