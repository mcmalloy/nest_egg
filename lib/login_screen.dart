
import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:nest_egg/utils/customcolors.dart';

const backgroundStartColor = Color(0xFFFFD500);
const backgroundEndColor = Color(0xFFF6A00C);
CustomColors customColors = CustomColors();
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            color: customColors.dashboardTheme,
            child: Column(children: [
              WindowTitleBarBox(
                  child: Row(children: [
                    Expanded(child: MoveWindow()),
                    WindowButtons()
                  ])),
            ])));
  }
}

final buttonColors = WindowButtonColors(
    iconNormal: customColors.selectedDashboardItemTheme,
    mouseOver: customColors.selectedDashboardItemThemeB,
    mouseDown: Color(0xFF805306),
    iconMouseOver: Color(0xFF805306),
    iconMouseDown: Color(0xFFFFD500));

final closeButtonColors = WindowButtonColors(
    mouseOver: customColors.selectedDashboardItemThemeB,
    mouseDown: Color(0xFFB71C1C),
    iconNormal: customColors.selectedDashboardItemTheme,
    iconMouseOver: Colors.white);

class WindowButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(colors: buttonColors),
        MaximizeWindowButton(colors: buttonColors),
        CloseWindowButton(colors: closeButtonColors),
      ],
    );
  }
}
