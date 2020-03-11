import 'package:flutter/material.dart';
import 'package:mlog/tomato/tomato_manager.dart';

import '../model/tomato_entity.dart';
import 'tomato_running_page.dart';

class TomatoStartPage extends StatelessWidget {
  SelectTypeWidget  selectTypeWidget;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("番茄闹钟"),
      ),
      body: buildContent(context),
    );
  }

  Widget buildContent(BuildContext context){
    selectTypeWidget = new SelectTypeWidget();
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        buildTitle(),
        buildTip(),
        Padding(
          padding: const EdgeInsets.only(left: 12, right: 12, top: 24 ,bottom: 24),
          child: selectTypeWidget,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24),
          child: buildStartButton(context),
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

  Widget buildStartButton(BuildContext context){
    return GestureDetector(
      onTap: (){
        startWorkClock(context);
      },
      behavior: HitTestBehavior.opaque,
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
            "开始计时",
            style: TextStyle(
              color: Colors.indigo,
              fontSize: 15
            )
        ),
      ),
    );
  }

  void startWorkClock(BuildContext context){
//    TomatoManager.instance.startWorkClock(context, selectTypeWidget.getSelectItem());
    Navigator.push(
      context,
      new MaterialPageRoute(builder: (context) => new TomatoRunningPage()),
    );
  }
}
class SelectTypeWidget extends StatefulWidget {
  int selectIndex = 0;
  List<TomatoTypeItem> list = EntityFactory.buildDefaultTypeList();
  int rowNumber = 3;
  @override
  _SelectTypeWidgetState createState() => _SelectTypeWidgetState();

  TomatoTypeItem getSelectItem(){
    return list[selectIndex];
  }
}

class _SelectTypeWidgetState extends State<SelectTypeWidget> {

  @override
  Widget build(BuildContext context) {
    List<TomatoTypeItem> list = widget.list;
    int rowNumber = widget.rowNumber;
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

