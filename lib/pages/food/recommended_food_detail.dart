import 'package:ecommerce_app/utils/colors.dart';
import 'package:ecommerce_app/utils/dimensions.dart';
import 'package:ecommerce_app/widgets/app_icon.dart';
import 'package:ecommerce_app/widgets/big_text.dart';
import 'package:ecommerce_app/widgets/expandable_text.dart';
import 'package:flutter/material.dart';

class RecommendedFoodWidget extends StatelessWidget {
  const RecommendedFoodWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 70,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius20),
                      topRight: Radius.circular(Dimensions.radius20),
                    )),
                width: double.maxFinite,
                padding: const EdgeInsets.only(top: 5, bottom: 10),
                child: Center(child: BigText(text: "Chile en Nogada")),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/images/food04.jpg",
                width: double.maxFinite,
                fit: BoxFit.cover,
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.add_shopping_cart_outlined)
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: Dimensions.width20),
                  child: ExpandableTextWidget(
                    text:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer tincidunt eleifend ante, id mollis nisi. Phasellus facilisis, magna et lacinia feugiat, metus nisl sodales felis, ut dignissim sapien felis id metus. Suspendisse in dui suscipit odio scelerisque auctor ut eu nibh. Ut ultricies justo condimentum libero accumsan congue. Nam non lobortis lorem. Duis tincidunt luctus dui at scelerisque. Cras eu lacinia dui. Etiam dictum lobortis neque a pellentesque. Donec id placerat nisi. Proin at eros suscipit, tristique risus nec, dictum quam. Proin vel velit eget ex condimentum lobortis ac at tellus. Mauris erat risus, sollicitudin a vestibulum sit amet, luctus sed mi. Proin id arcu sagittis, hendrerit nulla sed, malesuada ligula. Duis fermentum tincidunt tortor, id imperdiet lorem posuere sed. Donec eu turpis a ipsum tristique mattis pellentesque at diam. Fusce pulvinar aliquam velit id sagittis. Cras tempor consectetur dui non aliquam. Ut rutrum, lorem vel venenatis interdum, magna sem fringilla arcu, id euismod purus augue vitae enim. Nulla fringilla lacinia quam eget accumsan. Phasellus ultricies venenatis metus quis fermentum. Aenean nulla diam, eleifend in orci non, placerat accumsan orci. Integer sodales velit vitae nisl vestibulum pharetra. Sed eget placerat ante. Integer quis felis quam. Ut ut volutpat eros, eu porta tortor. Suspendisse potenti. Vivamus sit amet ante laoreet erat ultrices malesuada. Praesent placerat maximus mattis. Quisque nec fermentum felis, eu placerat odio. Duis luctus orci vitae turpis sagittis, eu convallis nulla tempus. Aliquam eleifend volutpat diam, ut blandit metus semper eu. Cras tempor ligula sit amet nisi rutrum, in sagittis leo ullamcorper. Donec at pharetra nisl. Duis varius mi nec egestas cursus. Sed sem sapien, interdum at tellus eu, varius rutrum est. Suspendisse vitae erat id nisl blandit commodo ac sed orci. Duis bibendum arcu tellus, ut pharetra ante consequat non. Mauris in lorem lobortis, tempus ipsum id, ultrices lacus. Proin in tellus tempor eros tristique dapibus a eu mauris. Mauris in leo dignissim, rutrum sem non, volutpat massa. Praesent commodo consequat mauris at luctus. Nam et magna consectetur, molestie leo ac, bibendum tellus. Nullam commodo, enim ullamcorper mollis pulvinar, magna massa molestie turpis, id iaculis ligula lectus nec eros. Duis et orci ac enim fermentum condimentum. Integer ornare cursus mauris, sed ullamcorper tellus tempor at. Donec luctus accumsan velit a venenatis. Phasellus mauris mi, mattis at felis nec, mattis aliquam elit. Etiam sit amet ullamcorper dui. Curabitur consequat lorem est, sed faucibus justo viverra nec. Nullam consectetur auctor neque. Morbi semper quam condimentum augue ullamcorper, sit amet ullamcorper dolor sagittis.',
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                horizontal: Dimensions.width20 * 2.5,
                vertical: Dimensions.height10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.remove,
                  iconSize: Dimensions.iconSize24,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                ),
                BigText(
                  text: "\$12.88 X 0 ",
                  color: AppColors.mainBlackColor,
                  size: Dimensions.font26,
                ),
                AppIcon(
                  icon: Icons.add,
                  iconSize: Dimensions.iconSize24,
                  backgroundColor: AppColors.mainColor,
                  iconColor: Colors.white,
                )
              ],
            ),
          ),
          Row(
            children: [],
          ),
        ],
      ),
    );
  }
}
