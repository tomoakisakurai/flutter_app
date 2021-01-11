import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/next_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ようこそフラッター',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'パスワードポスト'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> titleList = ['Amazon', '楽天', 'Yahoo!'];
  List<String> pwList = ['aaa', 'bbb', 'ccc'];
  final Set<String> saved = Set<String>();

  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random(); //適当な文字列を生成するlib
    return Scaffold(
      appBar: AppBar(
        title: Text(wordPair.asPascalCase),
      ),
      body: buildListview(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ボタンをpushしたときの発火関数
          titleList.add('Google');
          print(titleList);
          setState(() {});
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget buildListview() {
    return ListView.builder(
        itemCount: titleList.length,
        itemBuilder: (BuildContext context, int i) {
          String title = titleList[i];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            //複数のColumnウィジェットを縦に並べてくれる
            children: [
              Container(
                child: ListTile(
                  leading: Icon(Icons.vpn_key),
                  title: Text(title),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NextPage(title)));
                  },
                ),
              ),
              Container(
                child: IconButton(
                  color: Colors.red,
                  icon: saved.contains(title)
                      ? Icon(Icons.favorite)
                      : Icon(Icons.favorite_border),
                  tooltip: 'Increase volume by 10',
                  onPressed: () {
                    setState(() {
                      if (!saved.contains(title)) {
                        saved.add(title);
                      } else {
                        saved.remove(title);
                      }
                    });
                  },
                ),
              ),
              Divider()
            ],
          );
        });
  }
}
