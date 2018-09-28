import "package:flutter/material.dart";
import "package:mtc2018_app/colors.dart";

class ConferenceMapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> boothA = [
      "メルカリにおける量子アニーリングの研究",
      "経営課題をエンジニアリングで解決、Corporate Solutions Engineering の取り組み",
      "エキスパートチームの取り組み（Gopher道場、Go Fridayなど）",
      "MTC App by Flutter",
      "AQAチームによるテスト自動化及びZapier自動化ブース",
      "クイズ・iOS app Rearchitecture",
      "Welcome to Mercari US",
      "Days in Mercari Android",
      "We are the Machine Learning team!!"
    ];
    List<String> boothB = [
      "Mercari & Microservices",
      "研究開発組織「R4D」",
      "Ask the Speaker"
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
                            child: Text("Ask the Speakerについて",
                                style: TextStyle(
                                    color: kMtcPrimaryGrey,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold))),
                        Container(
                            padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 60.0),
                            child: Text(
                                "セッション後、登壇者と直接お話いただける場を設けています。SESSIONの疑問/質問などぜひ話しにお立ち寄りください。登壇者はSESSION終了後〜次のSESSIONが開始してから15分間までAsk the Speakerブースにいます。",
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
