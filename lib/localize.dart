import "package:flutter/material.dart";
import "dart:async";
import "package:flutter/foundation.dart" show SynchronousFuture;

class MtcLocalizations {
  MtcLocalizations(this.locale);

  final Locale locale;

  static MtcLocalizations of(BuildContext context) {
    return Localizations.of<MtcLocalizations>(context, MtcLocalizations);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    "en": {
      "Close": "Close",
      "Show": "Show",
      "news_title": "News",
      "about_description": """
Mercari Tech Conf (MTC) is a technology conference introducing the future business direction and the technological challenges of the companies of the Mercari Group to fellow engineers.
The theme of Mercari Tech Conf 2018 is Evolution. At this second annual conference we will introduce how the Mercari Group has evolved over the past year, and the changes yet to come.
In addition to various talk sessions, there will also be exhibition booths run by our various engineering teams as well as an after party with food and drinks provided. We hope all attendees can take advantage of this opportunity to socialize and network with your fellow engineers.
Simultaneous interpretation into English and Japanese will be provided for all sessions.
""",
      "about_access_title": "Roppongi Academyhills",
      "about_access_address":
          "Mori Tower 49th Floor 6-10-1 Roppongi, Minato-ku, Tokyo 106-0032",
      "about_access_subway_title": "Access by Subway",
      "about_access_subway_description":
          "Tokyo Metro Hibiya Line Roppongi Station / 3 min. walk from Exit 1C (Direct link to concourse)\nToei Subway Oedo Line Roppongi Station / 6 min. walk from Exit 3",
      "about_access_bus_title": "Access by Bus",
      "about_access_bus_title_from_shibuya": "From Shibuya Station",
      "about_access_bus_description_from_shibuya":
          "Toei Route RH01 bus (Shibuya Station ⇔ Roppongi Hills): Get off at “Roppongi Hills” or “Roppongi Hills Keyakizaka” (Approx. 15 min.)\nToei Route 01 bus (Shibuya Station ⇔ Shimbashi Station): Get off at “EX-THEATER-ROPPONGI-MAE” (Approx. 14 min.)",
      "about_access_bus_title_from_shinjuku": "From Shimbashi Station",
      "about_access_bus_description_from_shinjuku":
          "Toei Route 01 bus (Shimbashi Station ⇔ Shibuya Station) : Exit at “EX-THEATER-ROPPONGI-MAE” (Approx. 16 min.)",
      "about_open_map": "Open map",
      "about_access_to_academyhills": "Access to the Academyhills",
      "about_academyhills_site": "To the official website of Academyhills",
      "booth1": "Potential Applications of Quantum Annealing at Mercari",
      "booth2":
          "Solving Business Challenges with Engineering: Mercari’s Corporate Solutions Engineering Team",
      "booth3": "Initiatives by the Expert Team (Gopher Dojo, Go Friday, etc.)",
      "booth4": "MTC App by Flutter",
      "booth5": "AQA Team Test Automation and Zapier Automation Booth",
      "booth6": "iOS App Rearchitecture Quiz",
      "booth7": "Welcome to Mercari US",
      "booth8": "Days in Mercari Android",
      "booth9": "We are the Machine Learning Team!",
      "booth10": "Mercari & Microservices",
      "booth11": "Research and development organization \"R4D\"",
      "booth12": "Ask the Speaker",
      "ask_the_speaker_title": "Ask the Speaker",
      "ask_the_speaker_description":
          "Ask the Speaker is an opportunity for you to talk directly to MTC speakers after their sessions. If you have any questions about a session, drop by after the session is finished and ask them anything! Speakers will move to the Ask the Speaker booth after their session ends, and remain there for the first 15 minutes of the following session."
    },
    "ja": {
      "Close": "閉じる",
      "Show": "表示する",
      "news_title": "お知らせ",
      "about_description": """
Mercari Tech Conf（MTC）は、株式会社メルカリをはじめとするメルカリグループ各社が、これから目指す方向や、これから取り組む技術的なチャレンジについてご紹介するエンジニア向けの技術カンファレンスです。
今年で第2回となる「Mercari Tech Conf 2018」では、テーマを「Evolution（変化）」として、この1年間でメルカリグループ内に起こった、もしくは起こりつつある変化をご紹介します。
各セッションに加え、昨年好評だった各エンジニアチームによる展示ブース、そしてお食事やお飲み物をご用意したAfter Party（懇親会）もございますので、是非エンジニア同士の交流の場としてもご活用ください。
なお、各セッションには日本語・英語の同時通訳をご用意しております。
          """,
      "about_access_title": "六本木アカデミーヒルズ",
      "about_access_address": "〒106-6149\n東京都港区六本木６丁目１０番１号 六本木ヒルズ森タワー49F",
      "about_access_subway_title": "電車でお越しの方",
      "about_access_subway_description":
          "東京メトロ 日比谷線「六本木」駅1C出口より徒歩3分（コンコースにて直結）\n都営地下鉄 大江戸線「六本木」駅3出口より徒歩6分",
      "about_access_bus_title": "バスでお越しの方",
      "about_access_bus_title_from_shibuya": "渋谷駅より",
      "about_access_bus_description_from_shibuya":
          "都バス都RH01系統【渋谷駅前⇔六本木ヒルズ】／「六本木ヒルズ」「六本木ヒルズけやき坂」下車（約15分）\n都バス 都01系統【渋谷駅前⇔新橋駅前】／「EXシアター六本木前」下車（約14分）",
      "about_access_bus_title_from_shinjuku": "新宿駅より",
      "about_access_bus_description_from_shinjuku":
          "都バス 都01系統【新橋駅前⇔渋谷駅前 】／「EXシアター六本木前」下車（約16分）",
      "about_open_map": "マップを開く",
      "about_access_to_academyhills": "アカデミーヒルズまでのアクセス",
      "about_academyhills_site": "アカデミーヒルズ公式サイトへ",
      "booth1": "メルカリにおける量子アニーリングの研究",
      "booth2": "経営課題をエンジニアリングで解決、Corporate Solutions Engineering の取り組み",
      "booth3": "エキスパートチームの取り組み（Gopher道場、Go Fridayなど）",
      "booth4": "MTC App by Flutter",
      "booth5": "AQAチームによるテスト自動化及びZapier自動化ブース",
      "booth6": "クイズ・iOS app Rearchitecture",
      "booth7": "Welcome to Mercari US",
      "booth8": "Days in Mercari Android",
      "booth9": "We are the Machine Learning team!!",
      "booth10": "Mercari & Microservices",
      "booth11": "研究開発組織「R4D」",
      "booth12": "Ask the Speaker",
      "ask_the_speaker_title": "Ask the Speakerについて",
      "ask_the_speaker_description":
          "セッション後、登壇者と直接お話いただける場を設けています。SESSIONの疑問/質問などぜひ話しにお立ち寄りください。登壇者はSESSION終了後〜次のSESSIONが開始してから15分間までAsk the Speakerブースにいます。"
    },
  };

  String get close {
    return _localizedValues[locale.languageCode]["Close"];
  }

  String get show {
    return _localizedValues[locale.languageCode]["Show"];
  }

  String get newsTitle {
    return _localizedValues[locale.languageCode]["news_title"];
  }

  String get aboutDescription {
    return _localizedValues[locale.languageCode]["about_description"];
  }

  String get aboutAccessTitle {
    return _localizedValues[locale.languageCode]["about_access_title"];
  }

  String get aboutAccessAddress {
    return _localizedValues[locale.languageCode]["about_access_address"];
  }

  String get aboutAccessSubwayTitle {
    return _localizedValues[locale.languageCode]["about_access_subway_title"];
  }

  String get aboutAccessSubwayDescription {
    return _localizedValues[locale.languageCode]
        ["about_access_subway_description"];
  }

  String get aboutAccessBusTitle {
    return _localizedValues[locale.languageCode]["about_access_bus_title"];
  }

  String get aboutAccessBusTitleFromShibuya {
    return _localizedValues[locale.languageCode]
        ["about_access_bus_title_from_shibuya"];
  }

  String get aboutAccessBusDescriptionFromShibuya {
    return _localizedValues[locale.languageCode]
        ["about_access_bus_description_from_shibuya"];
  }

  String get aboutAccessBusTitleFromShinjuku {
    return _localizedValues[locale.languageCode]
        ["about_access_bus_title_from_shinjuku"];
  }

  String get aboutAccessBusDescriptionFromShinjuku {
    return _localizedValues[locale.languageCode]
        ["about_access_bus_description_from_shinjuku"];
  }

  String get aboutOpenMap {
    return _localizedValues[locale.languageCode]["about_open_map"];
  }

  String get aboutAccessToAcademyhills {
    return _localizedValues[locale.languageCode]
        ["about_access_to_academyhills"];
  }

  String get aboutAcademyhillsSite {
    return _localizedValues[locale.languageCode]["about_academyhills_site"];
  }

  String get booth1 {
    return _localizedValues[locale.languageCode]["booth1"];
  }

  String get booth2 {
    return _localizedValues[locale.languageCode]["booth2"];
  }

  String get booth3 {
    return _localizedValues[locale.languageCode]["booth3"];
  }

  String get booth4 {
    return _localizedValues[locale.languageCode]["booth4"];
  }

  String get booth5 {
    return _localizedValues[locale.languageCode]["booth5"];
  }

  String get booth6 {
    return _localizedValues[locale.languageCode]["booth6"];
  }

  String get booth7 {
    return _localizedValues[locale.languageCode]["booth7"];
  }

  String get booth8 {
    return _localizedValues[locale.languageCode]["booth8"];
  }

  String get booth9 {
    return _localizedValues[locale.languageCode]["booth9"];
  }

  String get booth10 {
    return _localizedValues[locale.languageCode]["booth10"];
  }

  String get booth11 {
    return _localizedValues[locale.languageCode]["booth11"];
  }

  String get booth12 {
    return _localizedValues[locale.languageCode]["booth12"];
  }

  String get askTheSpeakerTitle {
    return _localizedValues[locale.languageCode]["ask_the_speaker_title"];
  }

  String get askTheSpeakerDescription {
    return _localizedValues[locale.languageCode]["ask_the_speaker_description"];
  }
}

class MtcLocalizationsDelegate extends LocalizationsDelegate<MtcLocalizations> {
  const MtcLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => ["en", "ja"].contains(locale.languageCode);

  @override
  Future<MtcLocalizations> load(Locale locale) {
    return SynchronousFuture<MtcLocalizations>(MtcLocalizations(locale));
  }

  @override
  bool shouldReload(MtcLocalizationsDelegate old) => false;
}
