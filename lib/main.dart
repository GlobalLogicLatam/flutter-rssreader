import 'package:flutter/material.dart';
import 'package:flutter_rss/model/RSSResult.dart';
import 'package:flutter_rss/model/RSSItem.dart';
import 'package:flutter_rss/network/RssRequest.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter RSS',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
    
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("RSS"),
      ),
      body: new Center(
        child: FutureBuilder<RSSResult>(
          future: RssRequest().execute(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.numResults,
                itemBuilder: (BuildContext context, int position) {
                  return getRow(snapshot.data.results[position]);
                  },
              );
            } else if (snapshot.hasError) {
              return new Text("${snapshot.error}");
            }
            return new CircularProgressIndicator();
          }
        )
      ),
    );
  }

  Widget getRow(RSSItem rssItem) {
    return Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Image.network(rssItem.multimedia.last.url),
            Text(
              rssItem.title,
              style: new TextStyle(
                fontWeight: FontWeight.bold,
              )
            ),
            Text(rssItem.multimedia.last.caption.padRight(100))
          ],
        ),
    );
  }
}
