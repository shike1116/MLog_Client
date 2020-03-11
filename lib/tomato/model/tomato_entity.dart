
import 'dart:ui';

import 'package:flutter/material.dart';

import '../tomato_constant.dart';

class EntityFactory{
  static List<TomatoTypeItem> buildDefaultTypeList(){
    List<TomatoTypeItem> list = new List();
    list.add(
        TomatoTypeItem()
          ..type = TomatoConstant.TYPE_WORK
          ..title = "工作"
          ..color = Colors.blue
          ..icon = "images/ic_work.png"

    );

    list.add(
        TomatoTypeItem()
          ..type = TomatoConstant.TYPE_STUDY
          ..title = "学习"
          ..color = Colors.green
          ..icon = "images/ic_study.png"
    );

    list.add(
        TomatoTypeItem()
          ..type = TomatoConstant.TYPE_THINK
          ..title = "思考"
          ..color = Colors.orange
          ..icon = "images/ic_think.png"
    );

    list.add(
        TomatoTypeItem()
          ..type = TomatoConstant.TYPE_WRITE
          ..title = "写作"
          ..color = Colors.teal
          ..icon = "images/ic_write.png"
    );

    list.add(
        TomatoTypeItem()
          ..type = TomatoConstant.TYPE_SPORT
          ..title = "运动"
          ..color = Colors.deepPurple
          ..icon = "images/ic_sport.png"
    );

    list.add(
        TomatoTypeItem()
          ..type = TomatoConstant.TYPE_READ
          ..title = "阅读"
          ..color = Colors.red
          ..icon = "images/ic_read.png"
    );
    return list;
  }

}

class TomatoTypeItem{
  int type;
  String icon;
  String title;
  Color color;
}
