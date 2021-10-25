import 'package:flutter/material.dart';
import 'package:nest_egg/utils/customcolors.dart';

class OverviewPage extends StatefulWidget {
  const OverviewPage({Key? key}) : super(key: key);

  @override
  _OverviewPageState createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  CustomColors customColors = CustomColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customColors.dribblePageViewBackground,
      body: Column(
        children: [
          Row(
            children: [topLeftDashboardWidget(), topRightDashboardWidget()],
          ),
          Row(
            children: [bottomLeftDashboardWidget(), bottomRightDashboardWidget()],
          ),
        ],
      ),
    );
  }

  Widget topLeftDashboardWidget() {
    return Expanded(
      child: Container(),
    );
  }

  Widget topRightDashboardWidget() {
    return Expanded(
      child: Container(),
    );
  }

  Widget bottomLeftDashboardWidget() {
    return Expanded(
      child: Container(),
    );
  }

  Widget bottomRightDashboardWidget() {
    return Expanded(
      child: Container(),
    );
  }
}
