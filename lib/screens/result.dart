import 'package:data_priv/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets.dart';
import 'qr.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:typed_data';
import 'package:crypto/crypto.dart';

Future<Album> fetchAlbum() async {
  String? target = url.getUrl();
  String apiKey =
      'dc94c68629dd38e8b5b9619276a161d08d8553f4a415c4e473b2d81abcdb31b2';
  final response = await http.get(Uri.parse(
      'https://www.virustotal.com/vtapi/v2/url/report?apikey=$apiKey&resource=$target'));
  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

class Results extends StatefulWidget {
  const Results({Key? key}) : super(key: key);

  @override
  State<Results> createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  late Future<Album> futureAlbum;
  Future<void> urlLauncher(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception("Cannot launch Url $url");
    }
  }

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        url.setUrl("");
        return true;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Center(
            child: Column(children: <Widget>[
              logoWidget("images/koç_logo.png"),
              const SizedBox(
                height: 30,
              ),
              newButton(
                context,
                "Go to website",
                () {
                  urlLauncher(url.getUrl()!);
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Text('Scanned URL: ' + url.getUrl()!),
              SizedBox(height: 20),
              FutureBuilder<Album>(
                future: futureAlbum,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data!.positives == 0) {
                      return Text('Website is safe');
                    } else {
                      return Column(
                        children: [
                          Text(
                              'Website is scanned by : ${snapshot.data!.total} providers.'),
                          SizedBox(height: 20),
                          Text(
                              'Number of providers found the website malicious : ${snapshot.data!.positives}')
                        ],
                      );
                    }
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return CircularProgressIndicator();
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
