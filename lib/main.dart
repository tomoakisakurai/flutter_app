import 'package:flutter/material.dart';
import 'package:flutter_app/next_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Pageです'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("パスワードポスト"),
      ),
      body: ListView.builder(
          itemCount: titleList.length,
          itemBuilder: (BuildContext context, int i) {
            String title = titleList[i];
            return Column(
              //複数のColumnウィジェットを縦に並べてくれる
              children: [
                ListTile(
                  leading: Icon(Icons.vpn_key),
                  title: Text(title),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NextPage(title)));
                  },
                ),
                Divider()
              ],
            );
          }),
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
}
