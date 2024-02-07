import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_23/models/pharm_model.dart';
import 'package:flutter_application_23/pages/pharm_detail_page.dart';

class OnGenerateRoute{
  static  Route<dynamic>? onGenerateRoute(RouteSettings settings){
  
      if(Platform.isAndroid){
        return MaterialPageRoute(builder: (context) => PharmacyDetailPage(pharm: settings.arguments as PharmacyModel),);
      }else{
        return CupertinoPageRoute(builder: (context) => PharmacyDetailPage(pharm: settings.arguments as PharmacyModel),);
      }
    
  }
}
