import 'package:flutter/material.dart';

class TimeTablePage extends StatelessWidget {

  Widget buildSessionCard(String timeRange, String title, List<String> typeLabels, String text, String speakerName, String speakerType) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0, bottom: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            buildSessionTimeRange(timeRange),
            buildSessionTitle(title),
            buildSessionTypeLabels(typeLabels),
            buildSessionText(text),
            buildSessionSpeakerInformation(speakerName, speakerType)
          ],
        )
      )
    );
  }

  Widget buildSessionTimeRange(String text) {
    return Container(margin: const EdgeInsets.only(bottom: 5.0), child: new Text(text, style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0, color: Colors.black)));
  }

  Widget buildSessionTitle(String title) {
    return Container(margin: const EdgeInsets.only(bottom: 10.0), child: new Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0, color: Colors.black)));
  }

  Widget buildSessionTypeLabels(List<String> titles) {
    List<Container> containers = titles.map((title) { return buildSessionTypeLabel(title); }).toList();
    return Container(child: new Row(children: containers));
  }

  Container buildSessionTypeLabel(String title) {
    return new Container(
      margin: const EdgeInsets.all(2.0),
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: const Border(
          top: const BorderSide(width: 1.0),
          left: const BorderSide(width: 1.0),
          bottom: const BorderSide(width: 1.0),
          right: const BorderSide(width: 1.0),
        ),
        color: const Color(0xDDDDDD)
      ),
      child: new Text(title, style: TextStyle(color: Colors.black))
    );
  }

  Widget buildSessionText(String text) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Text(text, style: TextStyle(color: Colors.black))
    );
  }

  Widget buildSessionSpeakerInformation(String speakerName, String speakerType) {
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(width: 1.0)),
        color: Color(0xDDDDDD)
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(0.0),
        leading: const Icon(Icons.camera, color: Colors.black, size: 50.0),
        title: Text(speakerName, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
        subtitle: Text(speakerType, style: TextStyle(color: Colors.black)),
        // trailing: IconButton(icon: const Icon(Icons.favorite_border), color: Colors.black, onPressed: () { AlertDialog(title: Text('Go to the session!'), content: Text('Hey!')); }),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(margin: const EdgeInsets.all(0.0), child:
      DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: TabBar(
              tabs: [
                Tab(text: "エリアA"),
                Tab(text: "エリアB")
              ]
          ),
          body: TabBarView(
            children: [
              ListView(children: [
                buildSessionCard('10:00~11:00', 'このアプリ、Flutterです', ['iOS', 'Android'], 'このセッションでは、Flutterがほげほげがふがふがなることを証明します。', 'Aさん', 'Android Engineer'),
                buildSessionCard('10:00~11:00', 'このアプリ、Flutterです', ['iOS', 'Android'], 'このセッションでは、Flutterがほげほげがふがふがなることを証明します。', 'Aさん', 'Android Engineer'),
                buildSessionCard('10:00~11:00', 'このアプリ、Flutterです', ['iOS', 'Android'], 'このセッションでは、Flutterがほげほげがふがふがなることを証明します。', 'Aさん', 'Android Engineer'),
                buildSessionCard('10:00~11:00', 'このアプリ、Flutterです', ['iOS', 'Android'], 'このセッションでは、Flutterがほげほげがふがふがなることを証明します。', 'Aさん', 'Android Engineer')
              ]),
              ListView(children: [
                buildSessionCard('10:00~11:00', 'このアプリ、Flutterです', ['iOS', 'Android'], 'このセッションでは、Flutterがほげほげがふがふがなることを証明します。', 'Aさん', 'Android Engineer'),
                buildSessionCard('10:00~11:00', 'このアプリ、Flutterです', ['iOS', 'Android'], 'このセッションでは、Flutterがほげほげがふがふがなることを証明します。', 'Aさん', 'Android Engineer'),
                buildSessionCard('10:00~11:00', 'このアプリ、Flutterです', ['iOS', 'Android'], 'このセッションでは、Flutterがほげほげがふがふがなることを証明します。', 'Aさん', 'Android Engineer'),
                buildSessionCard('10:00~11:00', 'このアプリ、Flutterです', ['iOS', 'Android'], 'このセッションでは、Flutterがほげほげがふがふがなることを証明します。', 'Aさん', 'Android Engineer')
              ]),
            ],
          ),
        )
      )
    );
  }
}
