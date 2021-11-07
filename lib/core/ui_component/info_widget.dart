import 'package:flutter/cupertino.dart';
import 'package:flutter_first_project/core/functions/device_type.dart';
import 'package:flutter_first_project/core/model/device_info.dart';

class InfoWidget extends StatelessWidget {

   Widget Function(BuildContext, DeviceInfo) builder;


  InfoWidget(this.builder);



  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints){
      MediaQueryData mediaQuery= MediaQuery.of(context);
     DeviceInfo info = DeviceInfo(orientation: mediaQuery.orientation,
          deviceType: getDeviceType(mediaQuery),
          screenWidth: mediaQuery.size.width,
          screenHeight: mediaQuery.size.height,
          localWidth: constraints.maxWidth,
          localHeight: constraints.maxWidth);

      return builder(context, info);
    });
  }
}
