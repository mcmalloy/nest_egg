import 'package:flutter/material.dart';
import 'package:nest_egg/page_selector.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        dashboard(),
        const PageSelector()
      ],
    );
  }

  Widget dashboard() {
    return Column();
  }
}
