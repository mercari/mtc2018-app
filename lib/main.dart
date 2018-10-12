import "dart:async";

import "package:firebase_messaging/firebase_messaging.dart";
import "package:flutter/material.dart";
import "package:flutter_localizations/flutter_localizations.dart";
import 'package:mtc2018_app/api/client.dart';
import "package:mtc2018_app/cache/memcache.dart";
import "package:mtc2018_app/colors.dart";
import "package:mtc2018_app/localize.dart";
import "package:mtc2018_app/page/about_page.dart";
import "package:mtc2018_app/page/conference_map_page.dart";
import "package:mtc2018_app/page/content_page.dart";
import "package:mtc2018_app/page/news_page.dart";
import "package:mtc2018_app/page/session_detail.dart";
import "package:mtc2018_app/page/time_table_page.dart";
import "package:mtc2018_app/repository/cache_repository.dart";
import "package:mtc2018_app/repository/repository.dart";

void main() => runApp(MyApp());

final ThemeData _kMtcTheme = _buildMtcTheme();

ThemeData _buildMtcTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
      accentColor: kMtcSecondaryRed,
      primaryColor: kMtcPrimaryGrey,
      buttonColor: kMtcSecondaryRed,
      scaffoldBackgroundColor: kMtcBackgroundGrey,
      textSelectionColor: kMtcSecondaryRed,
      errorColor: kMtcSecondaryRed,
      canvasColor: kMtcPrimaryGrey,
      primaryIconTheme: base.iconTheme.copyWith(color: kMtcIcon),
      textTheme: base.textTheme.apply(fontFamily: 'Hiragino Kaku Gothic ProN'),
      primaryTextTheme:
          base.primaryTextTheme.apply(fontFamily: 'Hiragino Kaku Gothic ProN'),
      accentTextTheme:
          base.accentTextTheme.apply(fontFamily: 'Hiragino Kaku Gothic ProN'));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: _kMtcTheme,
      home: MainPage(),
      localizationsDelegates: [
        const MtcLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale("en", ""), // English
        const Locale("ja", ""), // Japanese
      ],
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _currentIndex = 0;
  FirebaseMessaging _firebaseMessaging = new FirebaseMessaging();

  static final Repository _repository =
      CacheRepository(cache: MemCache(), client: Client());

  @override
  void initState() {
    super.initState();
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        _showMessageDialog(message);
      },
      onResume: (Map<String, dynamic> message) async {
        _navigateToSessionDetail(message);
      },
      onLaunch: (Map<String, dynamic> message) async {
        await _navigateToSessionDetailOnLaunch(message);
      },
    );
    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {});
    _firebaseMessaging.getToken().then((token) {
      print(token);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Image.asset("images/navbar_icn.png"),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      settings: RouteSettings(name: "/news"),
                      builder: (context) =>
                          new NewsPage(repository: _repository)));
            },
          ),
        ],
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.map),
        foregroundColor: Colors.white,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) {
                    return ConferenceMapPage(repository: _repository);
                  },
                  fullscreenDialog: true));
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            title: Text("TIMETABLE"),
            icon: Icon(Icons.event_note),
          ),
          BottomNavigationBarItem(
              title: Text("BOOTH"), icon: Icon(Icons.local_activity)),
          BottomNavigationBarItem(
              title: Text("ABOUT"),
              icon: Image.asset("images/about_icn.png"),
              activeIcon: Image.asset("images/about_icn_active.png")),
        ],
        onTap: _onSelectTab,
        currentIndex: _currentIndex,
      ),
      body: _buildPage(),
    );
  }

  Widget _buildPage() {
    switch (_currentIndex) {
      case 0:
        return TimeTablePage(
          repository: _repository,
        );
      case 1:
        return ContentPage(repository: _repository);
      case 2:
        return AboutPage();
      default:
        return Text("No page");
    }
  }

  void _onSelectTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget _buildDialog(BuildContext context, String message) {
    return AlertDialog(
      content: Text(message),
      actions: <Widget>[
        FlatButton(
          child: Text(MtcLocalizations.of(context).close),
          onPressed: () {
            Navigator.pop(context, false);
          },
        ),
        FlatButton(
          child: Text(MtcLocalizations.of(context).show),
          onPressed: () {
            Navigator.pop(context, true);
          },
        ),
      ],
    );
  }

  void _showMessageDialog(Map<String, dynamic> message) {
    if (!message.containsKey("message")) {
      return;
    }
    showDialog<bool>(
      context: context,
      builder: (_) => _buildDialog(context, message["message"]),
    ).then((bool shouldNavigate) {
      if (shouldNavigate == true) {
        _navigateToSessionDetail(message);
      }
    });
  }

  var retryCount = 0;
  Future<Null> _navigateToSessionDetailOnLaunch(
      Map<String, dynamic> message) async {
    var sessionList = await _repository.getSessionList();
    if (sessionList.length == 0 && retryCount < 3) {
      retryCount += 1;
      await new Future.delayed(const Duration(milliseconds: 300));
      _navigateToSessionDetailOnLaunch(message);
      return;
    } else {
      _navigateToSessionDetail(message);
    }
  }

  void _navigateToSessionDetail(Map<String, dynamic> message) {
    if (!message.containsKey("id")) {
      return;
    }
    final String sessionId = message['id'];
    Navigator.push(
        context,
        MaterialPageRoute(
            settings: RouteSettings(name: "/session_detail"),
            builder: (context) {
              return SessionDetailPage(
                  repository: _repository, sessionId: sessionId);
            }));
  }
}
