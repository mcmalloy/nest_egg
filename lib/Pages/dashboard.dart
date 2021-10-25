import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:nest_egg/Pages/dashboard_page.dart';
import 'package:nest_egg/utils/CustomColors.dart';

CustomColors customColors = CustomColors();

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final PageController controller = PageController(initialPage: 0);
  int _selectedDashboardIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: HexColor("#22223A"),
        body: Stack(
          children: [
            Column(children: [
              WindowTitleBarBox(
                  child: Row(children: [
                Expanded(child: MoveWindow()),
                WindowButtons()
              ])),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: topBarWidget(),
                  ),
                  lineSeparator(),
                ],
              )
            ]),
            Positioned(top: 100, left: 0, child: dashboardWidget()),
            Positioned(
              top: 92,
              bottom: 0,
              right: 0,
              left: 400,
              child: dashboardPageView(),
            ),
            Positioned(
              bottom: 40,
              left: 40,
              child: logoutButton(),
            )
          ],
        ));
  }

  Widget topBarWidget() {
    return Row(
      children: [
        const Icon(
          Icons.multiline_chart,
          color: Colors.white,
          size: 32,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
        ),
        Text(
          "GetRich",
          style: GoogleFonts.montserrat(color: Colors.white, fontSize: 32),
        )
      ],
    );
  }

  Widget dashboardWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Column(
        children: [
          dashboardItemCard(0, Icons.dashboard, "Dashboard"),
          dashboardItemCard(1, Icons.insert_chart, "Mine Investeringer"),
          dashboardItemCard(2, Icons.account_balance, "Mine Udgifter")
        ],
      ),
    );
  }

  Widget dashboardItemCard(int index, IconData icon, String title) {
    bool _isActive = _selectedDashboardIndex == index;
    Radius _radius = const Radius.circular(32.0);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: InkWell(
        onTap: () {
          // Control the pageview controller with index and change the itemCard state between selected/unselected
          setState(() {
            _selectedDashboardIndex = index;
            controller.jumpToPage(_selectedDashboardIndex);
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          curve: Curves.fastOutSlowIn,
          height: 70,
          width: _isActive ? 360 : 320,
          decoration: BoxDecoration(
              color: _isActive
                  ? customColors.dribbleSilver.withOpacity(0.15)
                  : customColors.dashboardTheme,
              borderRadius:
                  BorderRadius.only(topLeft: _radius, bottomLeft: _radius)),
          child: Row(
            children: [
              const SizedBox(
                width: 30,
              ),
              Icon(
                icon,
                color: _isActive
                    ? customColors.dribbleWhite
                    : customColors.dribbleWhite.withOpacity(0.4),
              ),
              const SizedBox(
                width: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  title,
                  style: GoogleFonts.montserrat(
                    color: _isActive
                        ? customColors.dribbleWhite
                        : customColors.dribbleWhite.withOpacity(0.4),
                    fontSize: 26,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget logoutButton() {
    bool highlightedColor = false;
    return InkWell(
      onTap: () {},
      onHover: (_isHovering) {
        setState(() {
          highlightedColor = _isHovering;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        child: Row(
          children: [
            const Icon(
              Icons.logout,
              color: Colors.grey,
              size: 26,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 6),
            ),
            Text(
              "Log Ud",
              style: GoogleFonts.montserrat(color: Colors.grey, fontSize: 26),
            )
          ],
        ),
      ),
    );
  }

  Widget dashboardPageView() {
    return SizedBox(
      height: 1000,
      width: 1000,
      child: PageView(
        controller: controller,
        scrollDirection: Axis.vertical,
        children: [
          const OverviewPage(),
          Container(
            color: customColors.dribbleOrange,
            height: 100,
          ),
          /*
        Expanded(
          child: Container(
            color: customColors.dribbleOrange,
            width: MediaQuery.of(context).size.width,
            height: 100,
          ),
        )
         */
        ],
      ),
    );
  }

  Widget lineSeparator() {
    return Container(
      height: 3,
      width: MediaQuery.of(context).size.width,
      color: customColors.dribbleSilver.withOpacity(0.1),
    );
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
