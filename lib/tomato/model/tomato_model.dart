
import 'package:flutter/cupertino.dart';

import '../tomato_constant.dart';
import 'tomato_entity.dart';

class TomatoClockModel with ChangeNotifier{
  int currentTime;
  int clockState;
  TomatoTypeItem tomatoType;

  void initWorkClock(TomatoTypeItem typeItem){
    this.tomatoType = typeItem;
    this.clockState = TomatoConstant.STATE_WORK;
    this.currentTime = 0;
    notifyListeners();
  }
  /*
   * 返回是否继续 true表示继续计时 flase不再继续
   */
  bool alarmWorkClock(){
    if(clockState != TomatoConstant.STATE_WORK){
      return false;
    }
    this.currentTime ++;
    if(currentTime >= TomatoConstant.CLOCK_LENGTH_WORK){
      currentTime = TomatoConstant.CLOCK_LENGTH_WORK;
      clockState = TomatoConstant.STATE_WORK_END;
    }
    notifyListeners();
    return currentTime <= TomatoConstant.CLOCK_LENGTH_WORK && clockState == TomatoConstant.STATE_WORK;
  }





}