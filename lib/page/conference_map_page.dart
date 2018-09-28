import "package:flutter/material.dart";
import "package:mtc2018_app/colors.dart";

class ConferenceMapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                          padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 16.0),
                          child: Image.asset("images/booth_a.png"),
                        ),
                        Container(
                          color: kMtcAboutSectionBackgroundGrey,
                          child: Container(
                            padding: EdgeInsets.all(24.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // TODO: Refactor later
                                  Text(
                                    "1. メルカリにおける量子アニーリングの研究",
                                    style: TextStyle(color: kMtcPrimaryGrey),
                                  ),
                                  Text(
                                    "2. 経営課題をエンジニアリングで解決、Corporate Solutions Engineering の取り組み",
                                    style: TextStyle(color: kMtcPrimaryGrey),
                                  ),
                                  Text(
                                    "3. エキスパートチームの取り組み（Gopher道場、Go Fridayなど）",
                                    style: TextStyle(color: kMtcPrimaryGrey),
                                  ),
                                  Text(
                                    "4. MTC App by Flutter",
                                    style: TextStyle(color: kMtcPrimaryGrey),
                                  ),
                                  Text(
                                    "5. AQAチームによるテスト自動化及びZapier自動化ブース",
                                    style: TextStyle(color: kMtcPrimaryGrey),
                                  ),
                                  Text(
                                    "6. クイズ・iOS app Rearchitecture",
                                    style: TextStyle(color: kMtcPrimaryGrey),
                                  ),
                                  Text(
                                    "7. Welcome to Mercari US",
                                    style: TextStyle(color: kMtcPrimaryGrey),
                                  ),
                                  Text(
                                    "8. Days in Mercari Android",
                                    style: TextStyle(color: kMtcPrimaryGrey),
                                  ),
                                  Text(
                                    "9. We are the Machine Learning team!!",
                                    style: TextStyle(color: kMtcPrimaryGrey),
                                  ),
                                ]),
                          ),
                        )
                      ]),
                      ListView(padding: EdgeInsets.all(16.0), children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 16.0),
                          child: Image.asset("images/booth_b.png"),
                        ),
                        Container(
                            color: kMtcAboutSectionBackgroundGrey,
                            child: Container(
                              padding: EdgeInsets.all(24.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // TODO: Refactor later
                                    Text(
                                      "10. Mercari & Microservices",
                                      style: TextStyle(color: kMtcPrimaryGrey),
                                    ),
                                    Text(
                                      "11. 研究開発組織「R4D」",
                                      style: TextStyle(color: kMtcPrimaryGrey),
                                    ),
                                    Text(
                                      "12. Ask the Speaker",
                                      style: TextStyle(color: kMtcPrimaryGrey),
                                    ),
                                  ]),
                            ))
                      ]),
                    ],
                  ),
                ))));
  }
}
