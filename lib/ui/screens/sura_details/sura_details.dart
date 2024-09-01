import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_sun_c10/model/screen_details_args.dart';
import 'package:islami_sun_c10/ui/utils/app_theme.dart';
import 'package:islami_sun_c10/ui/widgets/app_scaffold.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName = "sura_details";
  const SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  String fileContent = "";
  late ScreenDetailsArgs args;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context)!.settings.arguments as ScreenDetailsArgs;
    if(fileContent.isEmpty){
      readSuraFile();
    }
    return AppScaffold(
      title: args.name,
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * .07,
          horizontal: 28,),

        padding: EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Text(fileContent,
            textAlign: TextAlign.center,
            textDirection: TextDirection.rtl,
            style: AppTheme.mediumTitleTextStyle,),
        ),
      ),);
  }

  Future<void> readSuraFile() async{
   Future<String> futureFileContent = rootBundle.loadString("assets/files/quran/${args.fileName}");
   fileContent = await futureFileContent;
   print(fileContent);
   List<String> fileLines = fileContent.split("\n");
   for(int i = 0; i < fileLines.length; i++){
     fileLines[i] += "{${i + 1}}";
   }
   fileContent = fileLines.join(" ");
   setState(() {});
  }
}
