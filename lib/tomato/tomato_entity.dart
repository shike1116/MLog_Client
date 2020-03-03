
import 'tomato_constant.dart';

class EntityFactory{
  static List<TomatoTypeItem> builDefaultTypeList(){
    List<TomatoTypeItem> list = new List();
    list.add(
        TomatoTypeItem()
          ..type = TomatoConstant.TYPE_WORK
          ..title = "工作"
    );

    list.add(
        TomatoTypeItem()
          ..type = TomatoConstant.TYPE_STUDY
          ..title = "学习"
    );

    list.add(
        TomatoTypeItem()
          ..type = TomatoConstant.TYPE_THINK
          ..title = "思考"
    );

    list.add(
        TomatoTypeItem()
          ..type = TomatoConstant.TYPE_WRITE
          ..title = "写作"
    );

    list.add(
        TomatoTypeItem()
          ..type = TomatoConstant.TYPE_SPORT
          ..title = "运动"
    );

    list.add(
        TomatoTypeItem()
          ..type = TomatoConstant.TYPE_READ
          ..title = "阅读"
    );
    return list;
  }

}

class TomatoTypeItem{
  int type;
  String icon;
  String title;

}
