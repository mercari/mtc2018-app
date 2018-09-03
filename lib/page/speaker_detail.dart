import 'package:flutter/material.dart';
import 'package:mtc2018_app/model/speaker.dart';

class SpeakerDetailPage extends StatelessWidget {
  Speaker speaker;

  SpeakerDetailPage(Speaker speaker) {
    this.speaker = speaker;
  }

  Widget buildBody() {
    return Container(
        margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
        child: ListView(children: <Widget>[
          Card(
              child: Container(
                  margin: const EdgeInsets.only(bottom: 10.0),
                  padding: const EdgeInsets.only(
                      left: 20.0, right: 20.0, bottom: 12.0, top: 12.0),
                  child: buildSpeakerInformation()))
        ]));
  }

  Widget buildSpeakerInformation() {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              margin: const EdgeInsets.only(bottom: 10.0),
              child: buildSessionSpeakerInformation()),
          Container(
              margin: const EdgeInsets.only(bottom: 20.0),
              child: Text(speaker.profile)),
          buildLinkLabels()
        ]);
  }

  Widget buildLinkLabels() {
    List<Widget> containers = ['Twitter', 'GitHub'].map((title) {
      return buildLinkLabel(title);
    }).toList();
    return Container(
        padding: const EdgeInsets.all(0.0), child: Row(children: containers));
  }

  Widget buildLinkLabel(String title) {
    return Container(
        margin: const EdgeInsets.only(right: 10.0),
        padding: const EdgeInsets.all(0.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            border: const Border(
              top: const BorderSide(width: 1.0, color: Colors.white),
              left: const BorderSide(width: 1.0, color: Colors.white),
              bottom: const BorderSide(width: 1.0, color: Colors.white),
              right: const BorderSide(width: 1.0, color: Colors.white),
            )),
        child: FlatButton(
            onPressed: () {},
            child: Text(title, style: TextStyle(color: Colors.white)),
            textTheme: ButtonTextTheme.primary));
  }

  Widget buildSessionSpeakerInformation() {
    return Container(
        child: ListTile(
      contentPadding: const EdgeInsets.all(0.0),
      leading: const Icon(Icons.android, color: Colors.white, size: 40.0),
      title: Text(speaker.name,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
      subtitle: Text(speaker.position, style: TextStyle(color: Colors.white)),
      // trailing: IconButton(icon: const Icon(Icons.favorite_border), color: Colors.black, onPressed: () { AlertDialog(title: Text('Go to the session!'), content: Text('Hey!')); }),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(speaker.name)), body: buildBody());
  }
}
