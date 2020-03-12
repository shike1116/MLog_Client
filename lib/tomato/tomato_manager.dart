import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'model/tomato_entity.dart';
import 'model/tomato_model.dart';
import 'tomato_constant.dart';

class TomatoManager {
  // 工厂模式
  factory TomatoManager() =>_getInstance();
  static TomatoManager get instance => _getInstance();
  static TomatoManager _instance;

  TomatoManager._internal() {
    // 初始化
  }
  static TomatoManager _getInstance() {
    if (_instance == null) {
      _instance = new TomatoManager._internal();
    }
    return _instance;
  }
  Timer _countTimer;

  void startWorkClock(BuildContext context, TomatoTypeItem type){
    TomatoClockModel _clockModel = Provider.of<TomatoClockModel>(context, listen: false);
    if(_clockModel != null){
      _clockModel.initWorkClock(type);
    }
    if(_countTimer != null){
      _countTimer.cancel();
      _countTimer = null;
    }
    _countTimer = new Timer.periodic(new Duration(seconds: 1), (timer) {
      TomatoClockModel _clockModel = Provider.of<TomatoClockModel>(context, listen: false);
      if(_clockModel != null){
        bool isContinue  = _clockModel.alarmWorkClock();
        if(!isContinue){
          //停止闹钟
          if(_countTimer != null){
            _countTimer.cancel();
            _countTimer = null;
          }
        }
      }
    });
  }
}