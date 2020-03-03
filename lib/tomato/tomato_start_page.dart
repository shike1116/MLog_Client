import 'package:flutter/material.dart';

class TomatoStartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("番茄闹钟"),
      ),
      body: buildContent(),
    );
  }

  Widget buildContent(){
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        buildTitle(),
        buildTip(),
        buildLine()
      ],
    );
  }

  Widget buildTitle(){
    return Center(
      child: new Text(
        "选择一个任务",
        style: TextStyle(
          fontSize: 20,
          color: Colors.black,
        ),
      ),
    );
  }

  Widget buildTip(){
    return Padding(
      padding: const EdgeInsets.only(top:20.0),
      child: Center(
        child: new Text(
          "接下来的25分钟，专注做这件事",
          style: TextStyle(
            fontSize: 15,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget buildLine(){
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: new Container(
        height: 0.5,
        color: Colors.grey,
      ),
    );
  }

}

