
import 'package:flutter/material.dart';

class TomatoRunningPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("番茄闹钟"),
      ),
      body: buildContent(),
    );
  }

  Widget buildContent() {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom:40.0),
          child: ClockWidget(),
        ),
        buildStopButton(),
        Padding(
          padding: const EdgeInsets.only(top:12.0),
          child: buildCancelButton(),
        ),
      ],
    );
  }
  Widget buildStopButton() {
    return Center(
      child: Container(
        //设置 child 居中
        alignment: Alignment(0, 0),
        height: 50,
        width: 180,
        //边框设置
        decoration: new BoxDecoration(
          //背景
          color: Colors.transparent,
          //设置四周圆角 角度
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
          //设置四周边框
          border: new Border.all(width: 1, color: Colors.indigo),
        ),
        child: Text(
            "暂停计时",
            style: TextStyle(
                color: Colors.indigo,
                fontSize: 16
            )
        ),
      ),
    );
  }

  Widget buildCancelButton() {
    return Center(
      child: Container(
        //设置 child 居中
        alignment: Alignment(0, 0),
        height: 50,
        width: 180,
        child: Text(
            "放弃",
            style: TextStyle(
                color: Colors.indigo,
                fontSize: 16
            )
        ),
      ),
    );
  }
}

class ClockWidget extends StatefulWidget {

  @override
  _ClockWidgetState createState() => _ClockWidgetState();
}

class _ClockWidgetState extends State<ClockWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment:AlignmentDirectional.center,
      children: <Widget>[
        buildCircle(),
        buildTimeText(),
        buildTitleText()
      ],
    );
  }

  Widget buildCircle(){
    return SizedBox(
      height: 200,
      width: 200,
      child: CircularProgressIndicator(
        backgroundColor: Colors.grey[200],
        valueColor: AlwaysStoppedAnimation(Colors.blue),
        value: .5,
      ),
    );
  }

  Widget buildTimeText(){
    return new Text(
      "12:00",
      style: TextStyle(
        color: Colors.blue,
        fontSize: 48,
        fontWeight: FontWeight.w300,
      ),
    );
  }

  Widget buildTitleText(){
    return SizedBox(
      height: 115,
      child: new Text(
        "计时中",
        style: TextStyle(
          color: Colors.blue,
          fontSize: 15,
        ),
      ),
    );
  }
}


