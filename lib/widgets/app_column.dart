import 'package:ecommerce_app/utils/colors.dart';
import 'package:ecommerce_app/utils/dimensions.dart';
import 'package:ecommerce_app/widgets/big_text.dart';
import 'package:ecommerce_app/widgets/small_text.dart';
import 'package:flutter/material.dart';

import 'icon_and_text_widget.dart';
class AppColumn extends StatelessWidget {
  final String title;
  const AppColumn({
    Key? key, required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BigText(text: title, size: Dimensions.font26,),
          SizedBox(height: Dimensions.height10),
          Row(
            children: [
              Wrap(
                  children: List.generate(
                5,
                (index) => Icon(
                  Icons.star,
                  color: AppColors.mainColor,
                  size: 15,
                ),
              )),
              const SizedBox(width: 10),
              SmallText(text: "4.5"),
              const SizedBox(width: 10),
              SmallText(text: "1729"),
              const SizedBox(width: 10),
              SmallText(text: "comments"),
            ],
          ),
          SizedBox(height: Dimensions.height20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconAndTextWidget(
                  icon: Icons.circle_sharp,
                  text: 'Normal',
                  iconColor: AppColors.iconColor1),
              IconAndTextWidget(
                  icon: Icons.location_on,
                  text: '1.7km',
                  iconColor: AppColors.mainColor),
              IconAndTextWidget(
                  icon: Icons.access_time_rounded,
                  text: '23min',
                  iconColor: AppColors.iconColor2),
            ],
          )
        ],
      );
  }
}
