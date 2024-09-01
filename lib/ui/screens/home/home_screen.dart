import 'package:flutter/material.dart';
import 'package:islami_sun_c10/ui/screens/home/tabs/ahadeth/ahadeth_tab.dart';
import 'package:islami_sun_c10/ui/screens/home/tabs/quran/quran_tab.dart';
import 'package:islami_sun_c10/ui/screens/home/tabs/radio/radio_tab.dart';
import 'package:islami_sun_c10/ui/screens/home/tabs/sebha/sebha_tab.dart';
import 'package:islami_sun_c10/ui/screens/home/tabs/settings/settings_tab.dart';
import 'package:islami_sun_c10/ui/utils/app_assets.dart';
import 'package:islami_sun_c10/ui/utils/app_colors.dart';

import '../../utils/app_localization_utils.dart';
import '../../widgets/app_scaffold.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home screen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTabIndex = 4;
  List<Widget> tabs = [
    QuranTab(),
    AhadethTab(),
    SebhaTab(),
    RadioTab(),
    SettingsTab()
  ];
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: context.l10n.suraName,
      bottomNavigation: buildBottomNavigation,
      body: tabs[currentTabIndex],
    );
  }

  Widget get buildBottomNavigation => Theme(
        data: Theme.of(context).copyWith(canvasColor: Theme.of(context).primaryColor),
        child: BottomNavigationBar(
          items: [
            buildBottomNavigationBarItem(
              "Quran",
              imagePath: AppAssets.icQuran,
            ),
            buildBottomNavigationBarItem(
              "Ahadeth",
              imagePath: AppAssets.icAhadeth,
            ),
            buildBottomNavigationBarItem(
              "Sebha",
              imagePath: AppAssets.icSebha,
            ),
            buildBottomNavigationBarItem(
              "Radio",
              imagePath: AppAssets.icRadio,
            ),
            buildBottomNavigationBarItem(
              "Settings",
              iconData: Icons.settings_rounded,
            ),
          ],
          currentIndex: currentTabIndex,
          onTap: (index) {
            currentTabIndex = index;
            setState(() {});
          },
        ),
      );

  BottomNavigationBarItem buildBottomNavigationBarItem(String label,
          {String? imagePath, IconData? iconData}) =>
      BottomNavigationBarItem(
          icon: imagePath != null
              ? ImageIcon(
                  AssetImage(imagePath),
                  size: 32,
                )
              : Icon(iconData!),
          label: label);
}
