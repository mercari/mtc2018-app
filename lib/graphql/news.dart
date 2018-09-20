import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';

class News {
  final String id;
  final String date;
  final String message;
  final String messageJa;
  final String link;

  News({this.id, this.date, this.message, this.messageJa, this.link});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      id: json['id'],
      date: json['date'],
      message: json['message'],
      messageJa: json['messageJa'],
      link: json['link'],
    );
  }
}

Future<List<News>> fetchNews() {
  return _client
      .post(_url,
          body: json.encode({
            'query': _query,
          }))
      .then((response) => _parseJSON(response))
      // エラーが起きたらデフォルトのやつを表示しておく
      .catchError(() => [
            News(
                date: '2018-09-04',
                id: '1',
                link: 'https://techconf.mercari.com/2018',
                messageJa: 'Mercari Tech Conf 2018のWebページが公開されました。',
                message: 'Mercari Tech Conf 2018のWebページが公開されました。'),
          ]);
}

String _url = 'https://techconf.mercari.com/2018/api/query';
http.Client _client = http.Client();
String _query = """
  {
    newsList {
      nodes {
        id
        date
        message
        messageJa
        link
      }
    }
  }
""";

List<News> _parseJSON(http.Response response) {
  var decoded = json.decode(utf8.decode(response.bodyBytes));
  List<dynamic> nodes = decoded['data']['newsList']['nodes'];
  return nodes.map((n) => News.fromJson(n)).toList();
}
