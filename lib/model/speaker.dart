import 'package:flutter/material.dart';

class Speaker {
  String name;
  String type;
  Icon icon;
  String description;
  String twitterUrl;
  String githubUrl;

  Speaker(String name, String type, Icon icon, String description, String twitterUrl, String githubUrl) {
    this.name = name;
    this.type = type;
    this.icon = icon;
    this.description = description;
    this.twitterUrl = twitterUrl;
    this.githubUrl = githubUrl;
  }
}
