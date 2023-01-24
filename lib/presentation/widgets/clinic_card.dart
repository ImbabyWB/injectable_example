import 'package:flutter/material.dart';
import 'package:task_1/core/Styles/text_styles.dart';
import 'package:task_1/core/colors/colors.dart';
import 'package:task_1/core/spaces.dart';
import 'package:task_1/data/model/clinic_model.dart';

class ClinicCard extends StatelessWidget {
  final Items items;

  const ClinicCard(this.items,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12 ,vertical: 8),
      decoration: BoxDecoration(
        color: white ,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0xffF2F2F2),
            offset: Offset(2,2),
            blurRadius: 3,
            spreadRadius: 2
          )
        ]
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12 ,right: 12,top: 12,bottom: 12),
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color:Colors.grey.shade300 ),
                    image: DecorationImage(
                      image: NetworkImage(items.image!),
                    )
                  ),
                   ),
                smallHSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(items.clinicName ?? "", style: mediumTextStyle,),
                    smallerVSpace,
                    Row(
                      children: [
                        const Icon(Icons.star , color: Color(0xffEB8B17),size: 16,),
                        Text(" ${items.rate}", style: smallTextStyle.copyWith(color: const Color(0xffD8D7D9)),),
                      ],
                    ),
                    smallerVSpace,
                    Row(
                      children: [
                        Text(items.distance.toString() , style: smallTextStyle,),
                        Text(" ${items.distanceUnit}" , style: smallTextStyle,),

                      ],
                    )
                   ],
                ),
                const Spacer(),
                Column(
                  children: [
                    Text( "${items.timeAgo.toString()} ${items.timeUnit.toString()}" , style: smallTextStyle,),
                    smallerVSpace,
                    Container(
decoration: BoxDecoration(color: mainColor, borderRadius: BorderRadius.circular(8)),                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: Text("${items.price} RS", style: mediumTextStyle.copyWith(color: white,fontSize: 14),),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            color: const Color(0xffF9F9F9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.location_pin,color: mainColor,),
                Text("${items.address}", style: mediumTextStyle,),

              ],
            ),
          ),
          smallVSpace,
          Padding(
            padding: const EdgeInsets.only(left: 12 ,right: 12,bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ButtonWidget(mainColor, "Book"),
                smallHSpace ,
                ButtonWidget(redColor, "Negotiate again"),
              ],
            ),
          )
        ],
      ),
    );
  }
}
class ButtonWidget extends StatelessWidget {
  final Color color ;
  final String title ;
  const ButtonWidget(this.color ,this.title,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(color: color , borderRadius: BorderRadius.circular(8)),
        child: Text(title ,style: mediumTextStyle.copyWith(color: white),),

      ),
    );
  }
}

