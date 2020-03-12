
import 'package:flutter/material.dart';
import '../model/tomato_model.dart';
import 'package:provider/provider.dart';

import '../tomato_constant.dart';

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
    TomatoClockModel clockModel = Provider.of<TomatoClockModel>(context);
    clockModel.initWorkClock(null);
    return Stack(
      alignment:AlignmentDirectional.center,
      children: <Widget>[
        buildCircle(clockModel),
        buildTimeText(clockModel),
        buildTitleText(clockModel)
      ],
    );
  }

  Widget buildCircle(TomatoClockModel clockModel){
    return SizedBox(
      height: 200,
      width: 200,
      child: CircularProgressIndicator(
        backgroundColor: Colors.grey[200],
        valueColor: AlwaysStoppedAnimation(Colors.blue),
        value: clockModel.currentTime / TomatoConstant.CLOCK_LENGTH_WORK,
      ),
    );
  }

  Widget buildTimeText(TomatoClockModel clockModel){
    int left = TomatoConstant.CLOCK_LENGTH_WORK - clockModel.currentTime;
    int minute = left~/ TomatoConstant.ONE_MINUTE;
    int second = left % TomatoConstant.ONE_MINUTE;
    String stMinute = minute >= 10 ? minute.toString() : "0$minute";
    String stSecond = second >= 10 ? second.toString() : "0$second";
    return new Text(
      "$stMinute:$stSecond",
      style: TextStyle(
        color: Colors.blue,
        fontSize: 48,
        fontWeight: FontWeight.w300,
      ),
    );
  }

  Widget buildTitleText(TomatoClockModel clockModel){
    return SizedBox(
      height: 110,
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


