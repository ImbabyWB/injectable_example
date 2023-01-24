import 'package:flutter/material.dart';
import 'package:task_1/core/Styles/text_styles.dart';
import 'package:task_1/core/colors/colors.dart';
import 'package:task_1/core/spaces.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .15,
      alignment: Alignment.bottomLeft,
      padding: const EdgeInsets.only(left: 12),
      decoration: BoxDecoration(color: mainColor ),
      child: Row(
        children: [
          const  Icon(Icons.close , color: Colors.white,),
          smallHSpace,
          Text("Request price" , style: bigTextStyle.copyWith(color: white,fontWeight: FontWeight.w600),),
          const Spacer(),
          Image.asset("assets/images/logo.png")
        ],
      ),
    );
  }
}
