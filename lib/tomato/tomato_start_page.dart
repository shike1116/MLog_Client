import 'package:flutter/material.dart';

import 'tomato_constant.dart';
import 'tomato_entity.dart';

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
        Padding(
          padding: const EdgeInsets.only(left: 12, right: 12, top: 24 ,bottom: 24),
          child: new SelectTypeWidget(),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24),
          child: buildStartButton(),
        )
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
      padding: const EdgeInsets.only(top:12.0),
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

  Widget buildStartButton(){
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
          "开始计时",
          style: TextStyle(
            color: Colors.indigo,
            fontSize: 15
          )
      ),
    );
//    return Center(
//      child: SizedBox(
//        height: 100,
//        width: 300,
//        child: new GestureDetector(
//          onTap: (){
//            //todo
//          },
//          behavior: HitTestBehavior.opaque,
//          child: new Text("开始记时"),
//        ),
//      ),
//    );
  }
}
class SelectTypeWidget extends StatefulWidget {
  int selectIndex = 0;
  @override
  _SelectTypeWidgetState createState() => _SelectTypeWidgetState();
}

class _SelectTypeWidgetState extends State<SelectTypeWidget> {

  List<TomatoTypeItem> list = EntityFactory.buildDefaultTypeList();
  int rowNumber = 3;
  @override
  Widget build(BuildContext context) {
    List<Widget> columnChilds = new List();
    List<Widget> rowChilds = new List();
    for (int i = 0; i < list.length; i++) {

      rowChilds.add(
          new Expanded(
            child: new Container(
                height: 114,
                child: buildItem(list[i], i == widget.selectIndex, i),
              ),
            flex: 1,
          )
      );

      if((i + 1 ) % rowNumber == 0 ){
        columnChilds.add(new Row(
          children: rowChilds,
        ));

        if(i + 1 != list.length ){
          columnChilds.add(new Container(
            height: 0.5,
            color: Colors.grey,
          ));
        }
        rowChilds = new List();
      }else{
        rowChilds.add(new Container(
          width: 0.5,
          height: 114,
          color: Colors.grey,
        ));
      }
    }
    return Column(
      children: columnChilds,
      mainAxisSize: MainAxisSize.min,
    );
  }

  Widget buildItem(TomatoTypeItem item, bool isSelected, int index){
    return GestureDetector(
      onTap: (){
        setState(() {
          widget.selectIndex = index;
        });
      },
      behavior: HitTestBehavior.opaque,
      child: Column(
        children: <Widget>[

          new Expanded(
            child: new Container(),
            flex: 1,
          ),
          new Image.asset(item.icon, height: 24, width: 24, color: item.color,),
          new SizedBox(height: 12),
          new Text(item.title,
            style: TextStyle(
              color: isSelected ? Colors.black : Colors.grey,
            ),
          ),
          new Expanded(
            child: new Container(),
            flex: 1,
          ),
          new Container(
            height: 2,
            color: isSelected ?  item.color : Colors.transparent,
          )
        ],
      ),
    );
  }

}

