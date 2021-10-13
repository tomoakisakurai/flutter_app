import 'package:flutter/material.dart';
import 'package:list_tile_switch/list_tile_switch.dart';

class UserInfo extends StatefulWidget {
  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: _userTitle('ユーザー情報'),
          ),
          Divider(
            thickness: 1,
            color: Colors.grey,
          ),
          _userListTile('Email', 'Email sub', 0, context),
          _userListTile('Phone NUmber', '4555', 1, context),
          _userListTile('Shipping Adress', '', 2, context),
          _userListTile('Joined Date', 'date', 3, context),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: _userTitle('ユーザー設定'),
          ),
          Divider(
            thickness: 1,
            color: Colors.grey,
          ),
          ListTileSwitch(
            value: _value,
            leading: Icon(Icons.dark_mode),
            onChanged: (value) {
              setState(() {
                _value = value;
              });
            },
            switchActiveColor: Colors.indigo,
            visualDensity: VisualDensity.comfortable,
            switchType: SwitchType.cupertino,
            title: const Text(
              'ダークモード',
            ),
          ),
          _userListTile('ログアウト', '', 4, context),
        ],
      ),
    );
  }

  List<IconData> _userTileIcons = [
    Icons.email,
    Icons.phone,
    Icons.local_shipping,
    Icons.watch_later,
    Icons.exit_to_app_rounded
  ];

  Widget _userListTile(
      String title, String subTitle, int index, BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        splashColor: Theme.of(context).splashColor,
        child: ListTile(
          onTap: () => print('tap'),
          title: Text(title),
          subtitle: Text(subTitle),
          leading: Icon(_userTileIcons[index]),
        ),
      ),
    );
  }

  Widget _userTitle(String title) {
    return Text(
      title,
      style: TextStyle(
          fontWeight: FontWeight.w700, fontSize: 23, color: Colors.grey[700]),
    );
  }
}
