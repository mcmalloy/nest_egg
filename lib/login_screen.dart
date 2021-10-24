import 'package:flutter/material.dart';
import 'package:nest_egg/utils/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  CustomColors customColors = CustomColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customColors.dashboardTheme,
      body: Stack(
        children: [
          loginBackgroundWidget(),
          loginFieldWidget()
        ],
      ),
    );
  }

  Widget loginBackgroundWidget(){
    return Container();
  }

  Widget loginFieldWidget() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 1000),

    );
  }
}
