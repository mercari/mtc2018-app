import "package:flutter/material.dart";
import "package:mtc2018_app/colors.dart";
import "package:mtc2018_app/localize.dart";

class ConferenceMapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> boothA = [
      MtcLocalizations.of(context).booth1,
      MtcLocalizations.of(context).booth2,
      MtcLocalizations.of(context).booth3,
      MtcLocalizations.of(context).booth4,
      MtcLocalizations.of(context).booth5,
      MtcLocalizations.of(context).booth6,
      MtcLocalizations.of(context).booth7,
      MtcLocalizations.of(context).booth8,
      MtcLocalizations.of(context).booth9
    ];
    List<String> boothB = [
      MtcLocalizations.of(context).booth10,
      MtcLocalizations.of(context).booth11,
      MtcLocalizations.of(context).booth12
    ];

    var boothIndex = 0;
    return Scaffold(
        appBar: AppBar(title: Text("Map"), centerTitle: false),
        body: Container(
            child: DefaultTabController(
                length: 2,
                child: Scaffold(
                  backgroundColor: Colors.white,
                  appBar: TabBar(
                    tabs: [Tab(text: "BOOTH A"), Tab(text: "BOOTH B")],
                    labelColor: kMtcSecondaryRed,
                    indicatorColor: kMtcSecondaryRed,
                  ),
                  body: TabBarView(
                    children: [
                      ListView(padding: EdgeInsets.all(16.0), children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 32.0),
                          child: Image.asset("images/booth_a.png"),
                        ),
                        Container(
                          color: kMtcAboutSectionBackgroundGrey,
                          child: Container(
                            padding: EdgeInsets.all(24.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: boothA.map((booth) {
                                  boothIndex += 1;
                                  return _buildBoothInfo(boothIndex, booth);
                                }).toList()),
                          ),
                        )
                      ]),
                      ListView(padding: EdgeInsets.all(16.0), children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 32.0),
                          child: Image.asset("images/booth_b.png"),
                        ),
                        Container(
                            color: kMtcAboutSectionBackgroundGrey,
                            child: Container(
                              padding: EdgeInsets.all(24.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: boothB.map((booth) {
                                    boothIndex += 1;
                                    return _buildBoothInfo(boothIndex, booth);
                                  }).toList()),
                            )),
                        Container(
                            padding: EdgeInsets.fromLTRB(0.0, 24.0, 0.0, 16.0),
                            child: Text(
                                MtcLocalizations.of(context).askTheSpeakerTitle,
                                style: TextStyle(
                                    color: kMtcPrimaryGrey,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold))),
                        Container(
                            padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 60.0),
                            child: Text(
                                MtcLocalizations.of(context)
                                    .askTheSpeakerDescription,
                                style: TextStyle(
                                    color: kMtcPrimaryGrey, fontSize: 14.0))),
                      ]),
                    ],
                  ),
                ))));
  }

  Widget _buildBoothInfo(int index, String text) {
    return Container(
        padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: EdgeInsets.only(right: 12.0),
                child: Text("$index. ",
                    style: TextStyle(
                        fontSize: 16.0,
                        color: kMtcPrimaryGrey,
                        fontWeight: FontWeight.bold))),
            Flexible(
                child: Text(text,
                    style: TextStyle(color: kMtcPrimaryGrey, fontSize: 14.0)))
          ],
        ));
  }
}
