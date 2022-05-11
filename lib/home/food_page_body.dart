import 'package:ecommerce_app/utils/colors.dart';
import 'package:ecommerce_app/widgets/big_text.dart';
import 'package:ecommerce_app/widgets/icon_and_text_widget.dart';
import 'package:ecommerce_app/widgets/small_text.dart';
import 'package:flutter/material.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  final PageController pageController = PageController(viewportFraction: 0.85);
  var _currPageValue = 0.0;
  double _scaleFactor = 0.8;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
     _currPageValue =  pageController.page!;

    });
  }
  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      child: PageView.builder(
        controller: pageController,
        itemCount: 5,
        itemBuilder: (context, position) {
          return _buildPageItem(position);
        },
      ),
    );
  }

  Widget _buildPageItem(int index) {
    // This is going to manage the animation
    Matrix4 matrix = new Matrix4.identity();
    return Stack(
      children: [
        Container(
          height: 220,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            // TODO: make an app theme
            color: index.isEven
                ? const Color(0xFF69c5df)
                : const Color(0xFF9294cc),
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/food01.jpg'),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 120,
            margin: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                // TODO: make an app theme
                color: Colors.white),
            child: Container(
              padding: const EdgeInsets.only(right: 15, left: 15, top: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: "Taco de Pastor"),
                  const SizedBox(height: 10),
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
                      // TODO: address the color shade
                      const SizedBox(width: 10),
                      SmallText(text: "4.5"),
                      const SizedBox(width: 10),
                      SmallText(text: "1729"),
                      const SizedBox(width: 10),
                      SmallText(text: "comments"),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      IconAndTextWidget(
                          icon: Icons.circle_sharp,
                          text: 'Normal',
                          iconColor: AppColors.iconColor1),
                      IconAndTextWidget(
                          icon: Icons.location_on,
                          text: '1.7km',
                          iconColor: AppColors.iconColor2),
                      IconAndTextWidget(
                          icon: Icons.access_time_rounded,
                          text: '23min',
                          iconColor: Colors.red),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
