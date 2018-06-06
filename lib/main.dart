import 'package:flutter/material.dart';

import 'package:transparent_image/transparent_image.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter_rss/model/RSSResult.dart';
import 'package:flutter_rss/model/RSSItem.dart';
import 'package:flutter_rss/network/RssRequest.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'New York Times RSS reader',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New York Times news"),
      ),
      body: Center(
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
              return Text("${snapshot.error}");
            }
            return CircularProgressIndicator();
          }
        )
      ),
    );
  }

  Widget getRow(RSSItem rssItem) {

    List<Widget> widgets = List();

    if (rssItem.hasMedia) {
      widgets.add(
        FadeInImage.memoryNetwork(
          placeholder: kTransparentImage,
          image: rssItem.multimedia.last.url
        )
      );
    }

    widgets.add(
      Text(
        rssItem.title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        )
      )
    );

    if (rssItem.hasMedia) {
      widgets.add(
        Text(rssItem.multimedia.last.caption.padRight(100))
      );
    }

    widgets.add(Divider());
    

    return GestureDetector(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: widgets
        ),
      ),
      onTap: () {
        if (rssItem.hasMedia) {
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => RSSDetailPage(rssItem: rssItem)
            )
          );
        }
      },
    );
  }
}


class RSSDetailPage extends StatelessWidget {

  final RSSItem rssItem;

  RSSDetailPage({Key key, @required this.rssItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(rssItem.title),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.open_in_browser),
            tooltip: "Open in browser",
            onPressed: () async {
              if (await canLaunch(rssItem.url)) {
                await launch(rssItem.url);
              }
            },
          )
        ],

      ),
      body: ListView(
        children: [
          Image.network(
            rssItem.multimedia.last.url,
            fit: BoxFit.fitWidth,
          ),
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Text(rssItem.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0
                )
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              rssItem.multimedia.last.caption,
              softWrap: true,
              style: TextStyle(
                  fontSize: 16.0
                )
            )
          )
        ]
      )
    );
  }
}