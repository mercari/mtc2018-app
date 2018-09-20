import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum SocialType { github, twitter }

class SocialUserButton extends StatelessWidget {
  final String title;
  final SocialType type;
  final String url;

  const SocialUserButton({
    Key key,
    this.title,
    this.type,
    this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    IconData icon;
    switch (type) {
      case SocialType.github:
        icon = FontAwesomeIcons.githubSquare;
        break;
      case SocialType.twitter:
        icon = FontAwesomeIcons.twitterSquare;
        break;
    }
    return Container(
        child: FlatButton(
            onPressed: _launchURL,
            padding: EdgeInsets.all(0.0),
            child: Row(children: [
              Icon(
                icon,
                color: kMtcPrimaryGrey,
              ),
              Container(
                width: 8.0,
              ),
              Text(title,
                  style: TextStyle(
                      color: kMtcPrimaryGrey,
                      decoration: TextDecoration.underline))
            ]),
            textTheme: ButtonTextTheme.primary));
  }

  _launchURL() async {
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}
