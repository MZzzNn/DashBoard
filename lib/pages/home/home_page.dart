import 'package:flutter/material.dart';
import 'widgets/dashboard_body.dart';
import 'widgets/header_bar.dart';
import 'widgets/side_menu_widget.dart';
import '../../shared/style/color.dart';
import '../../shared/app_responsive/app_responsive.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    void controlMenu() {
      if (!_scaffoldKey.currentState!.isDrawerOpen) {
        _scaffoldKey.currentState!.openDrawer();
      }
    }

    return Scaffold(
      backgroundColor: ColorManager.darkColor,
      drawer: const Padding(
        padding: EdgeInsets.only(top: 18.0),
        child: SideMenuWidget(),
      ),
      key: _scaffoldKey,
      appBar: (!AppResponsive.isDesktop(context) && !AppResponsive.isTablet(context)) ?AppBar(
        backgroundColor: ColorManager.lightDarkColor,
        elevation: 0,
      ):null,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            /// Side menu
            if (AppResponsive.isDesktop(context))
              const Expanded(
                flex: 2,
                child: SideMenuWidget(),
              ),

            if (!AppResponsive.isDesktop(context) && AppResponsive.isTablet(context))
              Container(
                width: AppResponsive.isDesktop(context) ? 0 : 50,
                decoration: BoxDecoration(
                  color: ColorManager.darkColor,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  children: [
                    if(!AppResponsive.isDesktop(context) || AppResponsive.isTablet(context))
                      const SizedBox(height: 25),
                    IconButton(
                      onPressed: () {
                        controlMenu();
                      },
                      icon: const Icon(Icons.menu, color: ColorManager.white),
                    ),
                    const Expanded(child: HeaderBarVertical()),
                  ],
                ),
              ),

            /// Main content
            const Expanded(
              flex: 9,
              child: DashboardBody(),
            )
          ],
        ),
      ),
    );
  }
}
