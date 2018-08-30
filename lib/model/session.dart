import 'package:flutter/material.dart';
import 'package:mtc2018_app/model/speaker.dart';

class Session {
  String timeRange;
  String title;
  List<String> labels;
  String text;
  Speaker speaker;

  Session(String timeRange, String title, List<String> labels, String text, Speaker speaker) {
    this.timeRange = timeRange;
    this.title = title;
    this.labels = labels;
    this.text = text;
    this.speaker = speaker;
  }
}