import 'package:flutter/material.dart';
import 'package:flutter_app/next_page.dart';
import 'package:flutter_app/providers/main_provider.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
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

// class MyHomePage extends StatefulWidget {
//   final String title;
//   MyHomePage({Key? key, required this.title}) : super(key: key);

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

class MyHomePage extends HookWidget {
  final String title;
  MyHomePage({Key? key, required this.title}) : super(key: key);

  List<String> titleList = ['Amazon', '楽天', 'Yahoo!'];
  List<String> pwList = ['aaa', 'bbb', 'ccc'];
  final Set<String> saved = Set<String>();

  @override
  Widget build(BuildContext context) {
    // final wordPair = WordPair.random(); //適当な文字列を生成するlib
    final int count = useProvider(counterProvider).state;
    print(count);
    return Scaffold(
      appBar: AppBar(
        title: Text(count.toString()),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                context.read(counterProvider).state = 0;
              },
              icon: Icon(Icons.reset_tv_rounded)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ],
      ),
      body: buildListview(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ボタンをpushしたときの発火関数
          // titleList.add('Google');
          // print(titleList);
          context.read(counterProvider).state++;
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'ホーム',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: '設定',
          ),
        ],
      ),
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
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                //複数のColumnウィジェットを縦に並べてくれる
                children: <Widget>[
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
                        // setState(() {
                        //   if (!saved.contains(title)) {
                        //     saved.add(title);
                        //   } else {
                        //     saved.remove(title);
                        //   }
                        // });
                      },
                    ),
                  ),
                  Divider(),
                ],
              )
            ],
          );
        });
  }
}
