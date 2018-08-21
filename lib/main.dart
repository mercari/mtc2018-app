import 'package:flutter/material.dart';
import 'package:mtc2018_app/page/time_table_page.dart';
import 'package:mtc2018_app/page/contents_page.dart';
import 'package:mtc2018_app/page/about_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mercari Tech Conf',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() =>  _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('M'),
        elevation: 4.0,
      ),
      bottomNavigationBar: BottomNavigationBar(
         items: [
           BottomNavigationBarItem(
             title: Text("TimeTable"),
             icon: Icon(Icons.list),
          ),
          BottomNavigationBarItem(
            title: Text("Contents"),
            icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
            title: Text("About"),
            icon: Icon(Icons.info)
          ),
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
        return ContentsPage();
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