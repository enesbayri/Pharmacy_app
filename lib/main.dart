

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_23/pages/home_page.dart';
import 'package:flutter_application_23/router/router.dart';
import 'package:flutter_application_23/tools/color_helper.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: ColorHelper.secondColor,systemNavigationBarColor: ColorHelper.secondColor));
  
  runApp(const ProviderScope(child: Pharmacy()));
}

class Pharmacy extends StatelessWidget {
  const Pharmacy({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Pharmacy',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: OnGenerateRoute.onGenerateRoute ,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: ColorHelper.mainColor),
          useMaterial3: true,
        ),
        home: const HomePage());
  }
}


