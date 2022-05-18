import 'package:dots_indicator/dots_indicator.dart';
import 'package:ecommerce_app/pages/food/popular_food_detail.dart';
import 'package:ecommerce_app/utils/colors.dart';
import 'package:ecommerce_app/utils/dimensions.dart';
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
  final double _scaleFactor = 0.8;
  final double _height = Dimensions.pageViewContainer;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // This was a container before so let's see how this behaves
    return Column(
      children: [
        // Slider section
        SizedBox(
          height: Dimensions.pageView,
          child: PageView.builder(
            controller: pageController,
            itemCount: 5,
            itemBuilder: (context, position) {
              return _buildPageItem(position);
            },
          ),
        ),
        // dots
        DotsIndicator(
          dotsCount: 5,
          position: _currPageValue,
          decorator: DotsDecorator(
            activeColor: AppColors.mainColor,
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
          ),
        ),
        // Popular text
        SizedBox(height: Dimensions.height30),
        Container(
          margin: EdgeInsets.only(left: Dimensions.height30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BigText(text: 'Popular'),
              SizedBox(width: Dimensions.width10),
              Container(
                margin: const EdgeInsets.only(bottom: 5),
                child: SmallText(text: '.', color: Colors.black26),
              ),
              SizedBox(width: Dimensions.width10),
              Container(
                margin: const EdgeInsets.only(bottom: 3),
                child: SmallText(text: 'Food pairing', color: Colors.black26),
              ),
            ],
          ),
        ),
        // list of food and images
        ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.symmetric(
                  horizontal: Dimensions.width20,
                  vertical: Dimensions.height10 / 2),
              child: Row(
                children: [
                  // image
                  Container(
                    width: Dimensions.listViewImgSize,
                    height: Dimensions.listViewImgSize,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimensions.radius20),
                      color: Colors.white38,
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/food02.jpg'),
                      ),
                    ),
                  ),
                  // Text container
                  Expanded(
                    child: Container(
                      height: Dimensions.listViewTextConSize,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(Dimensions.radius20),
                            bottomRight: Radius.circular(Dimensions.radius20),
                          ),
                          color: Colors.white),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: Dimensions.width10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Title
                            BigText(text: "Pozole dish"),
                            SizedBox(height: Dimensions.height10),
                            // subtitle
                            SmallText(
                              text: "Delicious soup with giant corn grains",
                              color: const Color(0xFFccc7c5),
                            ),
                            // icon text row
                            SizedBox(height: Dimensions.height10),
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
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _buildPageItem(int index) {
    Matrix4 animationMatrix() {
      // As far as I understand this is an empty matrix of 4 rows and 4 columns
      Matrix4 matrix = Matrix4.identity();
      int pageControllerRounded = _currPageValue.floor();
      isIndexEqPage(int number) => index == pageControllerRounded + number;

      var currScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
      if (isIndexEqPage(0)) {
        // This is equation is only true for the current index
        var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
        var currTrans = _height * (1 - currScale) / 2;
        matrix = Matrix4.diagonal3Values(1, currScale, 1)
          ..setTranslationRaw(0, currTrans, 0);
      }
      if (isIndexEqPage(1)) {
        var currScale =
            _scaleFactor + (_currPageValue - index + 1) * (1 - _scaleFactor);
        var currTrans = _height * (1 - currScale) / 2;
        matrix = Matrix4.diagonal3Values(1, currScale, 1);
        matrix = Matrix4.diagonal3Values(1, currScale, 1)
          ..setTranslationRaw(0, currTrans, 0);
      }
      if (isIndexEqPage(-1)) {
        var currScale = 1 - (_currPageValue - index) * (1 - _scaleFactor);
        var currTrans = _height * (1 - currScale) / 2;
        matrix = Matrix4.diagonal3Values(1, currScale, 1);
        matrix = Matrix4.diagonal3Values(1, currScale, 1)
          ..setTranslationRaw(0, currTrans, 0);
      }

      return matrix;
    }

    return Transform(
      transform: animationMatrix(),
      child: Stack(
        children: [
          Container(
            height: Dimensions.pageViewContainer,
            margin: EdgeInsets.symmetric(horizontal: Dimensions.width10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Dimensions.radius30),
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
              height: Dimensions.pageViewTextContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.width30,
                  right: Dimensions.width30,
                  bottom: Dimensions.height10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                // TODO: make an app theme
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xFFe8e8e8),
                    blurRadius: 5,
                    offset: Offset(0, 5), // changes position of shadow
                  ),
                  // This will cover the left side of the black shadow
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(-5, 0), // changes position of shadow
                  ),
                  // This will cover the right side of the black shadow
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(5, 0), // changes position of shadow
                  ),
                ],
              ),
              child: Container(
                padding: EdgeInsets.only(
                  right: Dimensions.width15,
                  left: Dimensions.width15,
                  top: Dimensions.height15,
                ),
                // TODO: I may use widget app column

                child: AppColumn(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

