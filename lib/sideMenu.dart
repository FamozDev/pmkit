import 'package:flutter/material.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:easy_sidemenu/src/global/global.dart';

SideMenuStyle menuStyle = SideMenuStyle(
  openSideMenuWidth: 250,
  compactSideMenuWidth: 66,
  iconSize: 16,
  itemHeight: 40,
  itemInnerSpacing: 4.0,
  hoverColor: Color.fromARGB(128, 50, 45, 68),
  itemOuterPadding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 5.0),
  backgroundColor: Color.fromARGB(255, 44, 42, 52),
  displayMode: SideMenuDisplayMode.auto,
  unselectedIconColor: Colors.white70,
  unselectedTitleTextStyle: TextStyle(color: Colors.white70),
  selectedColor: Color.fromARGB(255, 66, 64, 73),
  selectedTitleTextStyle: TextStyle(color: Color.fromARGB(255, 59, 207, 189)),
  selectedIconColor: Color.fromARGB(255, 59, 207, 189),
);

class LeftNavBar extends StatefulWidget {
  final PageController pageController;
  const LeftNavBar({Key? key, required this.pageController}) : super(key: key);

  @override
  State<LeftNavBar> createState() => _LeftNavBarState();
}

class _LeftNavBarState extends State<LeftNavBar> {
  SideMenuController sideMenu = SideMenuController();

  @override
  void initState() {
    Global.displayModeState.value = SideMenuDisplayMode.compact;
    sideMenu.addListener((index) {
      widget.pageController.jumpToPage(index);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SideMenu(
      style: menuStyle,
      controller: this.sideMenu,
      footer: Text('푸터'),
      items: [
        SideMenuItem(
          title: '대시보드',
          onTap: (index, _) {
            sideMenu.changePage(index);
          },
          icon: Icon(Icons.dashboard),
        ),
        SideMenuItem(
          title: '업무',
          onTap: (index, _) {
            sideMenu.changePage(index);
          },
          icon: Icon(Icons.work),
        ),
        SideMenuItem(
          title: '세팅',
          onTap: (index, _) {
            sideMenu.changePage(index);
          },
          icon: Icon(Icons.settings),
        ),
        // SideMenuItem(
        //   title: '종료',
        //   onTap: (index, _) {},
        //   icon: Icon(Icons.exit_to_app),
        // )
      ],
    );
  }

  @override
  void dispose() {
    sideMenu.dispose();
    super.dispose();
  }
}
