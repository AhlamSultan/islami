import 'package:flutter/material.dart';
import 'package:islami_sun_c10/model/screen_details_args.dart';
import 'package:islami_sun_c10/ui/screens/hadeth_details/hadeth_details.dart';

import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_theme.dart';
import '../../../../utils/constants.dart';

class AhadethTab extends StatelessWidget {
  const AhadethTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 3, child: Center(child: Image.asset(AppAssets.ahadethTabLogo))),
        Expanded(
          flex: 7,
          child: buildScreenContent(),
        )
      ],
    );
  }

  Widget buildScreenContent() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 3,
          color: AppColors.primaryLight,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              Expanded(
                  child: Text(
                    "Hadeth Name",
                    textAlign: TextAlign.center,
                    style: AppTheme.mediumTitleTextStyle,
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
        itemCount: 50,
        itemBuilder: (context, index) {
          String hadethName = "الحديث رقم  ${index + 1}";
          return InkWell(
            onTap: (){
              Navigator.pushNamed(context, HadethDetails.routeName,
              arguments: ScreenDetailsArgs(fileName: "h${index + 1}.txt", name: hadethName));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    child: Text(
                      hadethName,
                      textAlign: TextAlign.center,
                      style: AppTheme.regularTitleTextStyle,
                    )),
              ],
            ),
          );
        });
  }
}
