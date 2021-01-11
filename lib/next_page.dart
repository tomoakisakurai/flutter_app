import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class NextPage extends StatefulWidget {
  final String title;

  // コンストラクタ
  NextPage(this.title);

  @override
  NextPageState createState() => NextPageState();
}

class NextPageState extends State<NextPage> {
  @override
  //状態が変わるとbuildで更新される
  Widget build(BuildContext context) {
    final words = <WordPair>[];
    print(words);
    final font = const TextStyle(
        fontSize: 30.0, fontFamily: 'OpenSans', color: Colors.green);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Container(
              width: 50,
              child: Text('ID', style: font),
            ),
            Container(
              width: 20,
              child: Text(':'),
            ),
            Text('毎回同じIDを表示')
          ]),
          Padding(padding: EdgeInsets.all(20)),
          Row(children: [
            Container(
              width: 50,
              child: Text(
                'PW',
                style: font,
              ),
            ),
            Container(
              width: 20,
              child: Text(':'),
            ),
            Text('毎回同じパスワードを表示')
          ]),
        ]),
      ),
    );
  }
}
