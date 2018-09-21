import 'package:flutter/material.dart';
import 'package:mtc2018_app/page/time_table_page.dart';
import 'package:mtc2018_app/page/about_page.dart';
import 'package:mtc2018_app/page/news_page.dart';
import 'package:mtc2018_app/page/content_page.dart';
import 'package:mtc2018_app/colors.dart';

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
    // textTheme: _buildShrineTextTheme(base.textTheme),
    // primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme),
    // accentTextTheme: _buildShrineTextTheme(base.accentTextTheme),
    primaryIconTheme: base.iconTheme.copyWith(color: kMtcIcon),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mercari Tech Conf',
      theme: _kMtcTheme,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('images/navbar_icn.png'),
        centerTitle: false,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      settings: RouteSettings(name: "/news"),
                      builder: (context) => new NewsPage()));
            },
          ),
          // IconButton(
          //   icon: Icon(Icons.account_circle),
          //   onPressed: () {
          //     print("pressed");
          //   },
          // )
        ],
        elevation: 4.0,
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            title: Text("TIME TABLE"),
            icon: Icon(Icons.event_note),
          ),
          BottomNavigationBarItem(
              title: Text("CONTENTS"), icon: Icon(Icons.local_activity)),
          BottomNavigationBarItem(
              title: Text("ABOUT"),
              icon: Image.asset('images/about_icn.png'),
              activeIcon: Image.asset('images/about_icn_active.png')),
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
        return TimeTablePage();
      case 1:
        return ContentPage();
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
}
