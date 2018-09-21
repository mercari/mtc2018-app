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
