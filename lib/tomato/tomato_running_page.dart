
import 'package:flutter/material.dart';

class TomatoRunningPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        buildStopButton(),
        buildCancelButton(),
      ],
    );
  }
  Widget buildStopButton() {
    return Container(
      //设置 child 居中
      alignment: Alignment(0, 0),
      height: 50,
      width: 180,
      //边框设置
      decoration: new BoxDecoration(
        //背景
        color: Colors.white,
        //设置四周圆角 角度
        borderRadius: BorderRadius.all(Radius.circular(50.0)),
        //设置四周边框
        border: new Border.all(width: 1, color: Colors.indigo),
      ),
      child: Text(
          "暂停计时",
          style: TextStyle(
              color: Colors.indigo,
              fontSize: 15
          )
      ),
    );
  }

  Widget buildCancelButton() {
    return Container(
      //设置 child 居中
      alignment: Alignment(0, 0),
      height: 50,
      width: 180,
      //边框设置
      decoration: new BoxDecoration(
        //背景
        color: Colors.white,
        //设置四周圆角 角度
        borderRadius: BorderRadius.all(Radius.circular(50.0)),
        //设置四周边框
        border: new Border.all(width: 1, color: Colors.indigo),
      ),
      child: Text(
          "暂停计时",
          style: TextStyle(
              color: Colors.indigo,
              fontSize: 15
          )
      ),
    );
  }
}

