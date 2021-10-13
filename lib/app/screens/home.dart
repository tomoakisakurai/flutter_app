import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(slivers: [
        SliverAppBar(
          title: Text("Sliver appbar"),
          centerTitle: true,
          expandedHeight: 200,
          backgroundColor: Colors.blueAccent,
        ),
        SliverFillRemaining(
          child: Center(
            child: Text("Hello!"),
          ),
        )
      ]),
    );
  }
}
