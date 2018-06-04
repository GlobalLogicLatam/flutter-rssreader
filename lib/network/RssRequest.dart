import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter_rss/model/RSSResult.dart';

class RssRequest {

    Future<RSSResult> execute() async {

      final Uri url = Uri(
        scheme: 'https',
        host: 'api.nytimes.com',
        path: 'svc/topstories/v2/home.json',
        queryParameters: {"api-key" : "1c4b73654df943fcaf8090516732a734"}
      );

      final response = await http.get(url);
      final parsed = json.decode(response.body);
      return RSSResult.fromJson(parsed);

    }
    
}