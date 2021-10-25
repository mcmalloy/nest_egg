import 'package:flutter/material.dart';
import 'package:nest_egg/dashboard.dart';
import 'package:nest_egg/page_selector.dart';
import 'package:nest_egg/utils/customcolors.dart';

class NestEggScaffold extends StatefulWidget {
  const NestEggScaffold({Key? key}) : super(key: key);

  @override
  _NestEggState createState() => _NestEggState();
}

class _NestEggState extends State<NestEggScaffold> {
  CustomColors customColors = CustomColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customColors.dashboardTheme ,
        body: SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: const [
          Dashboard(),

        ],
      ),
    ));
  }
}
