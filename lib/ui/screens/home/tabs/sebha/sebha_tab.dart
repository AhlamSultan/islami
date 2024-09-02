import 'package:flutter/material.dart';

class SebhaTab extends StatefulWidget {
   const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int count = 0;

  int index = 0;

  double turn = 0;

  List <String> tasbeh = [ "سبحان الله","الحمد لله","لا إله إلا الله","الله أكبر" ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 2,
          child: Align(
            alignment: Alignment.center,
            child: Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width*0.22,
                    top: 27,
                  ),
                  child: Image.asset("assets/images/head_sebha_logo.png"),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height*0.12,
                  ),
                  child: AnimatedRotation(
                    duration:const Duration(milliseconds: 200) ,
                  turns: turn,
                  child: Image.asset("assets/images/body_sebha_logo.png")),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 3,
            child: Column(
              children: [
                const SizedBox(height: 43,),
                const Column(
                  children: [
                    Text("عدد التسبيحات" , style: TextStyle(fontWeight: FontWeight.w500 , fontSize: 35),),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(15),

                  ),
                  child: Text(count.toString(), style: const TextStyle(fontSize: 30),),
                ),
                const SizedBox(height: 22,),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                    onPressed: (){
                    setState(() {});
                    count++;
                    turn+=0.03;
                    if( count == 34){
                      count =0;
                      index++;
                      if(index == tasbeh.length){
                        index = 0;
                      }
                    }
                    },
                    child: Text( tasbeh[index] , style: const TextStyle(color: Colors.white , fontSize: 25),)
                )
              ],
            ),
            ),
      ],
    );
  }
}
//
//