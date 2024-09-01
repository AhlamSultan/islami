import 'package:flutter/material.dart';
import 'package:islami_sun_c10/ui/providers/language_provider.dart';
import 'package:islami_sun_c10/ui/providers/theme_provider.dart';
import 'package:islami_sun_c10/ui/utils/app_localization_utils.dart';
import 'package:islami_sun_c10/ui/utils/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  String selectedLanguage = "en";
  late LanguageProvider languageProvider;
  late ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    languageProvider = Provider.of(context);
    themeProvider = Provider.of(context);
     return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(context.l10n.language, style: themeProvider.mediumTitleTextStyle,),
          const SizedBox(height: 12,),
          buildLanguageDropDownButton(),
          const SizedBox(height: 8,),
          buildThemeSwitchRow(),
        ],
      ),
    );
  }

  Widget buildLanguageDropDownButton() {
    return DropdownButton<String>(
        value: selectedLanguage,
        items: const [
           DropdownMenuItem(value: "en", child: Text("English"),),
           DropdownMenuItem(value: "ar", child: Text("العربيه"),)
        ],
        isExpanded: true,
        onChanged: (newValue){
          selectedLanguage = newValue!;
          languageProvider.setCurrentLocale(selectedLanguage);
          setState(() {});
        });
  }

  Widget buildThemeSwitchRow() {
    return Row(
      children: [
        Text("Dark Theme"),
        Spacer(),
        Switch(value: themeProvider.currentThemeMode == ThemeMode.dark, onChanged: (newValue){
          themeProvider.toggleTheme(newValue);
        })
      ],
    );
  }
}
