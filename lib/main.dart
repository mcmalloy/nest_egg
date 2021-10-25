/*
Don't forget to add these 2 lines at the beggining of windows\runner\main.cpp

#include <bitsdojo_window_windows/bitsdojo_window_plugin.h>
auto bdw = bitsdojo_window_configure(BDW_CUSTOM_FRAME | BDW_HIDE_ON_STARTUP);

*/

import 'package:flutter/material.dart';
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:nest_egg/Pages/dashboard.dart';
import 'package:nest_egg/Pages/login_screen.dart';
import 'package:nest_egg/utils/customcolors.dart';

CustomColors customColors = CustomColors();
void main() {
  runApp(NestEgg());
  doWhenWindowReady(() {
    final win = appWindow;
    final initialSize = Size(1920, 1080);
    win.minSize = initialSize;
    win.size = initialSize;
    win.alignment = Alignment.center;
    win.title = "GetRichNibba";
    win.show();
  });
}

const borderColor = Color(0xFF805306);

class NestEgg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: WindowBorder(
                color: customColors.dashboardTheme,
                width: 1,
                child: const DashboardPage())));
  }
}