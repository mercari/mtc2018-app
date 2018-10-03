import "package:flutter/material.dart";
import "package:mtc2018_app/colors.dart";
import "package:url_launcher/url_launcher.dart";
import "dart:io" show Platform;
import "package:mtc2018_app/localize.dart";

var _horizontalSpace = 16.0;

var boxDecoration = BoxDecoration(
    color: kMtcAboutSectionBackgroundGrey,
    borderRadius: BorderRadius.circular(8.0));

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      Container(
        padding: EdgeInsets.fromLTRB(88.0, 72.0, 88.0, 56.0),
        child: Image.asset("images/about_logo.png"),
      ),
      Container(
          padding: EdgeInsets.fromLTRB(
              _horizontalSpace, 0.0, _horizontalSpace, 32.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "ABOUT",
              style: TextStyle(fontSize: 20.0),
            ),
            Container(height: 8.0),
            Container(
                decoration: boxDecoration,
                padding: EdgeInsets.all(24.0),
                child: Text(MtcLocalizations.of(context).aboutDescription,
                    style: TextStyle(height: 1.2)))
          ])),
      Container(
          padding: EdgeInsets.fromLTRB(
              _horizontalSpace, 0.0, _horizontalSpace, 32.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "ACCESS",
              style: TextStyle(fontSize: 20.0),
            ),
            Container(height: 8.0),
            Container(
                decoration: boxDecoration,
                padding: EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(MtcLocalizations.of(context).aboutAccessTitle,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Container(height: 16.0),
                    Text(MtcLocalizations.of(context).aboutAccessAddress),
                    FlatButton(
                      padding:
                          EdgeInsets.symmetric(vertical: 16.0, horizontal: 0.0),
                      onPressed: () async {
                        // Android
                        var url =
                            "geo:35.6604311,139.7287178?z=10&q=%e5%85%ad%e6%9c%ac%e6%9c%a8%e3%82%a2%e3%82%ab%e3%83%87%e3%83%9f%e3%83%bc%e3%83%92%e3%83%ab%e3%82%ba";
                        if (Platform.isIOS) {
                          // iOS
                          url =
                              "http://maps.apple.com/?sll=35.6604311,139.7287178&z=10&q=%e5%85%ad%e6%9c%ac%e6%9c%a8%e3%82%a2%e3%82%ab%e3%83%87%e3%83%9f%e3%83%bc%e3%83%92%e3%83%ab%e3%82%ba";
                        }
                        if (await canLaunch(url)) {
                          await launch(url);
                        }
                      },
                      child: Text(MtcLocalizations.of(context).aboutOpenMap,
                          style: TextStyle(
                              color: kMtcSecondaryRed,
                              decoration: TextDecoration.underline)),
                    ),
                  ],
                )),
          ])),
      Container(
          padding: EdgeInsets.fromLTRB(
              _horizontalSpace, 0.0, _horizontalSpace, 40.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(MtcLocalizations.of(context).aboutAccessSubwayTitle,
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold)),
            Container(height: 16.0),
            Text(MtcLocalizations.of(context).aboutAccessSubwayDescription,
                style: TextStyle(fontSize: 12.0)),
          ])),
      Container(
          padding: EdgeInsets.fromLTRB(
              _horizontalSpace, 0.0, _horizontalSpace, 32.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(MtcLocalizations.of(context).aboutAccessBusTitle,
                style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold)),
            Container(height: 16.0),
            Text(MtcLocalizations.of(context).aboutAccessBusTitleFromShibuya,
                style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold)),
            Container(height: 8.0),
            Text(
                MtcLocalizations.of(context)
                    .aboutAccessBusDescriptionFromShibuya,
                style: TextStyle(fontSize: 12.0)),
            Container(height: 16.0),
            Text(MtcLocalizations.of(context).aboutAccessBusTitleFromShinjuku,
                style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold)),
            Container(height: 8.0),
            Text(
                MtcLocalizations.of(context)
                    .aboutAccessBusDescriptionFromShinjuku,
                style: TextStyle(fontSize: 12.0)),
          ])),
      Container(
          padding: EdgeInsets.fromLTRB(
              _horizontalSpace, 0.0, _horizontalSpace, 32.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
                width: double.infinity,
                decoration: boxDecoration,
                padding: EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(MtcLocalizations.of(context).aboutAccessToAcademyhills,
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    FlatButton(
                      padding:
                          EdgeInsets.symmetric(vertical: 16.0, horizontal: 0.0),
                      onPressed: () async {
                        var url =
                            "http://forum.academyhills.com/roppongi/access/index.html";
                        if (await canLaunch(url)) {
                          await launch(url);
                        }
                      },
                      child: Text(
                          MtcLocalizations.of(context).aboutAcademyhillsSite,
                          style: TextStyle(
                              fontSize: 12.0,
                              color: kMtcSecondaryRed,
                              decoration: TextDecoration.underline)),
                    ),
                  ],
                )),
          ])),
      FlatButton(
        padding: EdgeInsets.fromLTRB(0.0, 16.0, 0.0, 32.0),
        onPressed: () {
          showLicensePage(
            context: context,
          );
        },
        child: Text("Licenses",
            style: TextStyle(
                fontSize: 12.0,
                color: kMtcSecondaryRed,
                decoration: TextDecoration.underline)),
      )
    ]);
  }
}
