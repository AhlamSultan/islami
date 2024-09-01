import 'package:flutter/material.dart';
import 'package:islami_sun_c10/model/screen_details_args.dart';
import 'package:islami_sun_c10/ui/providers/theme_provider.dart';
import 'package:islami_sun_c10/ui/screens/sura_details/sura_details.dart';
import 'package:islami_sun_c10/ui/utils/app_assets.dart';
import 'package:islami_sun_c10/ui/utils/app_colors.dart';
import 'package:islami_sun_c10/ui/utils/app_theme.dart';
import 'package:islami_sun_c10/ui/utils/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class QuranTab extends StatelessWidget {
  late ThemeProvider themeProvider;
  QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of(context);
    return Column(
      children: [
        Expanded(
            flex: 3, child: Center(child: Image.asset(AppAssets.quranTabLogo))),
        Expanded(
          flex: 7,
          child: Stack(
            alignment: Alignment.center,
            children: [
              buildScreenContent(context),
              Container(
                width: 3,
                height: double.infinity,
                color: AppColors.primaryLight,
              )
            ],
          ),
        )
      ],
    );
  }

  Widget buildScreenContent(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 3,
          color: AppColors.primaryLight,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  AppLocalizations.of(context)!.verses,
                  textAlign: TextAlign.center,
                  style: themeProvider.mediumTitleTextStyle,
                ),
              ),
              Expanded(
                  child: Text(
                    AppLocalizations.of(context)!.suraName,
                textAlign: TextAlign.center,
                style: themeProvider.mediumTitleTextStyle,
              )),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 3,
          color: AppColors.primaryLight,
        ),
        Expanded(flex: 7, child: buildSurasListView())
      ],
    );
  }

  ListView buildSurasListView() {
    return ListView.builder(
        itemCount: Constants.suraNames.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
              ScreenDetailsArgs arguments = ScreenDetailsArgs(
                  fileName: "${index + 1}.txt",
                  name: Constants.suraNames[index]);
              Navigator.pushNamed(context, SuraDetails.routeName,
                  arguments: arguments);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    child: Text(
                  "${Constants.versesNumber[index]}",
                  textAlign: TextAlign.center,
                  style: themeProvider.regularTitleTextStyle,
                )),
                Expanded(
                    child: Text(
                  Constants.suraNames[index],
                  textAlign: TextAlign.center,
                  style: themeProvider.regularTitleTextStyle,
                )),
              ],
            ),
          );
        });
  }
}
