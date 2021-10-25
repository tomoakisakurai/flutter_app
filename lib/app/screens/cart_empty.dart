import 'package:flutter/material.dart';

class CartEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 40),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/images/emptycart.png'))),
        ),
        Text(
          'カートが空です。',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.blueAccent,
              fontSize: 36,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 30),
        Text(
          'まだ追加されていません',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.grey, fontSize: 26, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: 50,
          child: ElevatedButton(
            child: Text("買い物をする"),
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                primary: Colors.indigo, //ボタンの背景色
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)))),
          ),
        ),
      ],
    );
  }
}
