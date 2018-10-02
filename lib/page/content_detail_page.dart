import "package:flutter/material.dart";
import "package:mtc2018_app/model/exhibition.dart";
import "package:mtc2018_app/localize.dart";
import "package:mtc2018_app/colors.dart";

class ContentDetailPage extends StatelessWidget {
  final Exhibition exhibition;

  const ContentDetailPage({Key key, this.exhibition}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(MtcLocalizations.of(context).boothDetailTitle),
          centerTitle: false,
        ),
        body: buildBody(context));
  }

  Widget buildBody(BuildContext context) {
    Widget image;
    if (exhibition.exhibitionImage != "") {
      image = ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(4.0), topRight: Radius.circular(4.0)),
          child: Image.asset("images/" + exhibition.exhibitionImage));
    }

    return Container(
        margin: EdgeInsets.only(top: 24.0),
        child: ListView(children: <Widget>[
          Container(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0),
              child: Material(
                  type: MaterialType.canvas,
                  child: Container(
                    color: kMtcBackgroundGrey,
                    child: Container(
                        margin: const EdgeInsets.only(bottom: 10.0),
                        child: Text(exhibition.localizedTitle(context),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22.0))),
                  ))),
          Container(
              margin: const EdgeInsets.only(top: 30.0),
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              color: Colors.white,
              child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 32.0, horizontal: 0.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        image != null ? image : Container(),
                        Container(
                            padding: EdgeInsets.fromLTRB(0.0, 24.0, 0.0, 32.0),
                            child: Text(
                                exhibition.localizedDescription(context),
                                style: TextStyle(
                                    fontSize: 14.0, color: kMtcPrimaryGrey))),
                        Container(
                            padding: EdgeInsets.only(bottom: 24.0),
                            child: Text("BOOTH MAP",
                                style: TextStyle(
                                    color: kMtcPrimaryGrey, fontSize: 24.0))),
                        Container(
                          child: Image.asset("images/" + exhibition.boothImage),
                        )
                      ])))
        ]));
  }
}
