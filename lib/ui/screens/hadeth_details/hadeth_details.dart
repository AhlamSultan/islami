import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_sun_c10/model/screen_details_args.dart';
import 'package:islami_sun_c10/ui/utils/app_theme.dart';
import 'package:islami_sun_c10/ui/widgets/app_scaffold.dart';

class HadethDetails extends StatefulWidget {
  static const String routeName = "Hadeth_details";
  const HadethDetails({super.key});

  @override
  State<HadethDetails> createState() => _HadethDetailsState();
}

class _HadethDetailsState extends State<HadethDetails> {
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
      readHadethFile();
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

  Future<void> readHadethFile() async{
   Future<String> futureFileContent = rootBundle.loadString("assets/files/ahadeth/${args.fileName}");
   fileContent = await futureFileContent;
   print(fileContent);
   setState(() {});
  }
}
