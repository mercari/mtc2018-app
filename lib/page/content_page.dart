import "package:flutter_web/material.dart";
import "package:mtc2018_app/colors.dart";
import 'package:mtc2018_app/localize.dart';
import "package:mtc2018_app/model/exhibition.dart";
import 'package:mtc2018_app/page/content_detail_page.dart';
import "package:mtc2018_app/repository/repository.dart";

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
    _init();
  }

  void _init() async {
    final exhibitionList = await widget.repository.getExhibitionList();
    setState(() {
      _exhibitionList = exhibitionList;
    });
  }

  // Future<Null> _handleRefresh() async {
  //   final exhibitionList = await widget.repository.refreshExhibitionList();
  //   setState(() {
  //     _exhibitionList = exhibitionList;
  //   });
  //   return null;
  // }

  @override
  Widget build(BuildContext context) {
    if (_exhibitionList.length == 0) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    var boothAExhibitions = _exhibitionList.where((e) => e.place == "BoothA");
    var boothBExhibitions = _exhibitionList.where((e) => e.place == "BoothB");

    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.white),
              flexibleSpace: SafeArea(
                  child: TabBar(
                tabs: [Tab(text: "BOOTH A"), Tab(text: "BOOTH B")],
                labelColor: kMtcSecondaryRed,
                indicatorColor: kMtcSecondaryRed,
                indicatorWeight: 4.0,
                unselectedLabelColor: Colors.white,
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
              ))),
          body: TabBarView(
            children: [
              ListView(
                  padding: EdgeInsets.all(8.0),
                  children: boothAExhibitions.map((exhibition) {
                    return _buildExhbiitionCard(context, exhibition);
                  }).toList()),
              ListView(
                  padding: EdgeInsets.all(8.0),
                  children: boothBExhibitions.map((exhibition) {
                    return _buildExhbiitionCard(context, exhibition);
                  }).toList()),
            ],
          ),
        ));
  }

  Widget _buildExhbiitionCard(BuildContext context, Exhibition exhibition) {
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
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      settings: RouteSettings(name: "/content_detail"),
                      builder: (context) {
                        return ContentDetailPage(
                          exhibition: exhibition,
                        );
                      }));
            },
            padding: EdgeInsets.all(0.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                image != null ? image : Container(),
                Container(
                    padding: const EdgeInsets.only(
                        top: 16.0, left: 24.0, right: 24.0),
                    child: Container(
                        child: Text(
                            exhibition.localizedTitle(
                                getCurrentLanguageCode(context)),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                                color: Colors.black)))),
                Container(
                    padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                    child: Container(
                        margin: const EdgeInsets.only(top: 8.0, bottom: 24.0),
                        child: Text(
                            exhibition.localizedDescription(
                                getCurrentLanguageCode(context)),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: Colors.black))))
              ],
            )));
  }
}
