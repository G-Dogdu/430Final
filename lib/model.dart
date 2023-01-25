import 'package:http/http.dart' as http;
import 'dart:convert';

class Album {
  String? scanId;
  String? scanDate;
  String? permalink;
  String? url;
  String? verboseMsg;
  int? total;
  int? positives;
  Map<String, dynamic>? scans;

  Album({
    this.scanId,
    this.scanDate,
    this.permalink,
    this.url,
    this.verboseMsg,
    this.total,
    this.positives,
    this.scans,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      scanId: json['scan_id'],
      scanDate: json['scan_date'],
      permalink: json['permalink'],
      url: json['url'],
      verboseMsg: json['verbose_msg'],
      total: json['total'],
      positives: json['positives'],
      scans: json['scans'],
    );
  }
}
