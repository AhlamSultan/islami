import 'package:flutter/material.dart';
import 'package:islami_sun_c10/ui/providers/theme_provider.dart';
import 'package:islami_sun_c10/ui/utils/app_assets.dart';
import 'package:islami_sun_c10/ui/utils/app_colors.dart';
import 'package:provider/provider.dart';

import '../utils/app_theme.dart';

class AppScaffold extends StatelessWidget {
  final String title;
  final Widget? bottomNavigation;
  final Widget body;
  const AppScaffold({super.key,
    required this.body,
    required this.title,
    this.bottomNavigation});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of(context);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(themeProvider.mainBackground))),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            title,
          ),
        ),
        bottomNavigationBar: bottomNavigation,
        body: body,
      ),
    );;
  }
}
