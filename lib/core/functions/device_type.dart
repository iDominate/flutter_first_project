

import 'package:flutter/material.dart';
import 'package:flutter_first_project/core/enums/device_type-enum.dart';

DeviceType getDeviceType(MediaQueryData data){
  Orientation orientation = data.orientation;
  double width = 0;
  if(orientation == Orientation.landscape){
    width = data.size.height;
  } else {
    width = data.size.width;
  }

  if(width >= 950){
    return DeviceType.Desktop;
  } else if(width >= 600){
    return DeviceType.Tablet;
  } else {
    return DeviceType.Mobile;
  }
}