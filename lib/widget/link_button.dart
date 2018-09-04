import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LinkButton extends StatelessWidget {
  final String title;
  final String url;

  const LinkButton({
    Key key,
    this.title,
    this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 4.0),
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
            onPressed: _launchURL,
            child: Text(title, style: TextStyle(color: Colors.white)),
            textTheme: ButtonTextTheme.primary));
  }

  _launchURL() async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}
