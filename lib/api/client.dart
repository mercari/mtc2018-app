import "package:http/http.dart" as http;
import "package:mtc2018_app/model/news.dart";
import "dart:convert";
import "dart:async";
import "package:mtc2018_app/model/session.dart";
import "package:mtc2018_app/model/exhibition.dart";
import 'package:flutter_web/services.dart' show rootBundle;

String _url = () {
  var isDebug = false;
  assert(isDebug = true);

  if (isDebug) {
    return "https://mtc2018.dev.citadelapps.com/2018/api/query";
  } else {
    return "https://techconf.mercari.com/2018/api/query";
  }
}();

class Client {
  static final Client _singleton = new Client._internal();

  http.Client _client;

  factory Client() {
    _singleton._client = http.Client();
    return _singleton;
  }

  Client._internal();

  Future<List<News>> fetchNews() async {
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
    var response = await _client.post(_url,
        body: json.encode({
          "query": _query,
        }));
    if (response.statusCode == 200) {
      var decoded = json.decode(utf8.decode(response.bodyBytes));
      List<dynamic> nodes = decoded["data"]["newsList"]["nodes"];
      return nodes.map((n) => News.fromJson(n)).toList();
    } else {
      // エラーが起きたらデフォルトのやつを表示しておく
      return [
        News(
            "1",
            "2018-09-04",
            "Mercari Tech Conf 2018のWebページが公開されました。",
            "Mercari Tech Conf 2018のWebページが公開されました。",
            "https://techconf.mercari.com/2018")
      ];
    }
  }

  Future<List<Session>> fetchSessions() async {
    String _query = """
    {
      sessionList {
        nodes {
          id
          type
          place
          title
          titleJa
          startTime
          endTime
          outline
          outlineJa
          lang
          tags
          speakers {
            id
            name
            nameJa
            company
            position
            positionJa
            profile
            profileJa
            iconUrl
            twitterId
            githubId
          }
        }
      }
    }
    """;

    var response = await _client.post(_url,
        body: json.encode({
          "query": _query,
        }));
    if (response.statusCode == 200) {
      var decoded = json.decode(utf8.decode(response.bodyBytes));
      List<dynamic> nodes = decoded["data"]["sessionList"]["nodes"];
      return nodes.map((n) => Session.fromJson(n)).toList();
    } else {
      return [];
    }
  }

  Future<Session> fetchSessionById(String sessionId) async {
    String _query = """
    {
      session(id: "$sessionId") {
        node {
          id
          type
          place
          title
          titleJa
          startTime
          endTime
          outline
          outlineJa
          lang
          tags
          speakers {
            id
            name
            nameJa
            company
            position
            positionJa
            profile
            profileJa
            iconUrl
            twitterId
            githubId
          }
        }
      }
    }
    """;

    var response = await _client.post(_url,
        body: json.encode({
          "query": _query,
        }));
    if (response.statusCode == 200) {
      var decoded = json.decode(utf8.decode(response.bodyBytes));
      dynamic node = decoded["data"]["session"]["node"];
      return Session.fromJson(node);
    } else {
      return null;
    }
  }

  Future<List<Exhibition>> fetchExhibitions() async {
    var jsonString = await rootBundle.loadString("data/exhibitions.json");
    List<dynamic> exhibitions = json.decode(jsonString);
    return exhibitions.map((e) => Exhibition.fromJson(e)).toList();

    // FIXME: Load exhibitions from local because api does not include images now.

    // String _query = """
    // {
    //   exhibitionList {
    //     nodes {
    //       id
    //       place
    //       title
    //       titleJa
    //       description
    //       descriptionJa
    //     }
    //   }
    // }
    // """;

    // var response = await _client.post(_url,
    //     body: json.encode({
    //       "query": _query,
    //     }));

    // if (response.statusCode == 200) {
    //   var decoded = json.decode(utf8.decode(response.bodyBytes));
    //   List<dynamic> nodes = decoded["data"]["exhibitionList"]["nodes"];
    //   return nodes.map((n) => Exhibition.fromJson(n)).toList();
    // } else {
    //   return [];
    // }
  }
}
