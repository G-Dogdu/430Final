import 'package:flutter/material.dart';

class CurrentUrl {
  String? url;

  CurrentUrl(this.url);

  String? getUrl() {
    return url;
  }

  void setUrl(String? newUrl) {
    url = newUrl;
  }
}
