import 'package:flutter/material.dart';
import 'package:mtc2018_app/page/session_detail.dart';
import 'package:mtc2018_app/page/speaker_detail.dart';
import 'package:mtc2018_app/model/session.dart';
import 'package:mtc2018_app/model/speaker.dart';

class TimeTablePage extends StatelessWidget {

  Widget buildSessionCard(BuildContext context, String timeRange, String title, List<String> typeLabels, String text, String speakerName, String speakerType) {
    return Card(
      color: Colors.white,
      child: FlatButton(
        onPressed: (){
          Navigator.push(
            context, 
            MaterialPageRoute(
              settings: RouteSettings(name: '/session_detail'),
              builder: (context) {
                Speaker speaker = new Speaker(
                  speakerName,
                  speakerType,
                  Icon(Icons.camera),
                  'He is happy',
                  'www.mercari.com',
                  'www.mercari.com'
                );
                Session session = new Session(
                  timeRange,
                  title,
                  typeLabels,
                  text,
                  speaker
                );
                return SessionDetailPage(session);
              }
            )
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0, bottom: 10.0), child: buildSessionTimeRange(timeRange)),
            Container(padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0), child: buildSessionTitle(title)),
            Container(padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0), child: buildSessionTypeLabels(typeLabels)),
            Container(padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0), child: buildSessionText(text)),
            Container(padding: const EdgeInsets.only(bottom: 20.0), child: buildSessionSpeakerInformation(context, speakerName, speakerType))
          ],
        )
      )
    );
  }

  Widget buildSessionTimeRange(String text) {
    return Container(margin: const EdgeInsets.only(bottom: 5.0), child: Text(text, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0, color: Colors.black)));
  }

  Widget buildSessionTitle(String title) {
    return Container(margin: const EdgeInsets.only(bottom: 10.0), child: Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0, color: Colors.black)));
  }

  Widget buildSessionTypeLabels(List<String> titles) {
    List<Container> containers = titles.map((title) { return buildSessionTypeLabel(title); }).toList();
    return Container(child: Row(children: containers));
  }

  Container buildSessionTypeLabel(String title) {
    return Container(
      margin: const EdgeInsets.all(2.0),
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        border: const Border(
          top: const BorderSide(width: 1.0),
          left: const BorderSide(width: 1.0),
          bottom: const BorderSide(width: 1.0),
          right: const BorderSide(width: 1.0),
        )
      ),
      child: Text(title, style: TextStyle(color: Colors.black))
    );
  }

  Widget buildSessionText(String text) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
      child: Text(text, style: TextStyle(color: Colors.black))
    );
  }

  Widget buildSessionSpeakerInformation(BuildContext context, String speakerName, String speakerType) {
    return FlatButton(
      onPressed: (){
      }, 
      child: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(width: 1.0)),
          color: Color(0xDDDDDD)
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.all(0.0),
          leading: const Icon(Icons.android, color: Colors.black, size: 40.0),
          title: Text(speakerName, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
          subtitle: Text(speakerType, style: TextStyle(color: Colors.black)),
          // trailing: IconButton(icon: const Icon(Icons.favorite_border), color: Colors.black, onPressed: () { AlertDialog(title: Text('Go to the session!'), content: Text('Hey!')); }),
        )
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
                buildSessionCard(context, '10:00~11:00', 'このアプリ、Flutterです', ['iOS', 'Android'], 'このセッションでは、Flutterがほげほげがふがふがなることを証明します。あああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああああ', 'Aさん', 'Android Engineer'),
                buildSessionCard(context, '10:00~11:00', 'このアプリ、Flutterです', ['iOS', 'Android'], 'このセッションでは、Flutterがほげほげがふがふがなることを証明します。', 'Aさん', 'Android Engineer'),
                buildSessionCard(context, '10:00~11:00', 'このアプリ、Flutterです', ['iOS', 'Android'], 'このセッションでは、Flutterがほげほげがふがふがなることを証明します。', 'Aさん', 'Android Engineer'),
                buildSessionCard(context, '10:00~11:00', 'このアプリ、Flutterです', ['iOS', 'Android'], 'このセッションでは、Flutterがほげほげがふがふがなることを証明します。', 'Aさん', 'Android Engineer')
              ]),
              ListView(children: [
                buildSessionCard(context, '10:00~11:00', 'このアプリ、Flutterです', ['iOS', 'Android'], 'このセッションでは、Flutterがほげほげがふがふがなることを証明します。', 'Aさん', 'Android Engineer'),
                buildSessionCard(context, '10:00~11:00', 'このアプリ、Flutterです', ['iOS', 'Android'], 'このセッションでは、Flutterがほげほげがふがふがなることを証明します。', 'Aさん', 'Android Engineer'),
                buildSessionCard(context, '10:00~11:00', 'このアプリ、Flutterです', ['iOS', 'Android'], 'このセッションでは、Flutterがほげほげがふがふがなることを証明します。', 'Aさん', 'Android Engineer'),
                buildSessionCard(context, '10:00~11:00', 'このアプリ、Flutterです', ['iOS', 'Android'], 'このセッションでは、Flutterがほげほげがふがふがなることを証明します。', 'Aさん', 'Android Engineer')
              ]),
            ],
          ),
        )
      )
    );
  }
}
