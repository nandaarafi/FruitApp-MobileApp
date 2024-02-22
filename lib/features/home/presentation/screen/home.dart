import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fruit_app/core/error/exceptions.dart';
import 'package:fruit_app/core/utils/constants/colors.dart';
import 'package:fruit_app/features/home/data/remote_data_source.dart';
import 'package:fruit_app/features/home/presentation/controller/home_controller.dart';
import 'package:fruit_app/features/home/presentation/screen/detail_product.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import '../../../../core/utils/helper/helper_functions.dart';
import '../../model/data_model.dart';
import '../widgets/app_bar.dart';
import '../widgets/search_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FAppBar(title: Text("Fruitful"), showBackArrow: false),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              SearchBarApp(text: "Search fruits, nuts, and more", padding: EdgeInsets.symmetric(horizontal: 10)),
              const SizedBox(height: 20),
              ProductHeader(onPressed: () {}),
              SizedBox(height: 16),
              Text(
                "Latest Product",
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 16),
              GridViewVertical(onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}

class GridViewVertical extends StatelessWidget {
  GridViewVertical({
    super.key,
    required this.onPressed,
  });

  final RemoteProductDataSourceImpl _remoteProductDataSourceImpl =
      RemoteProductDataSourceImpl();
  final VoidCallback onPressed;



  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _remoteProductDataSourceImpl
          .productData(), // Use readApiData instead of ReadJsonData
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text("${snapshot.error}"));
        } else if (snapshot.hasData) {
          List<ProductDataModel> latestProduct =
              snapshot.data as List<ProductDataModel>;
          return SingleChildScrollView(
            controller: ScrollController(),
            scrollDirection: Axis.vertical,
            clipBehavior: Clip.none,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: latestProduct == null ? 0 : latestProduct.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                var item = latestProduct[index];
                return GestureDetector(
                  onTap: () {
                    buildShowModalBottomSheet(context, item);
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 6, left: 6, bottom: 12),
                    padding: EdgeInsets.only(bottom: 15),
                    decoration: BoxDecoration(
                      color: FColors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            width: FHelperFunctions.screenWidth(),
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: DecorationImage(
                                image: NetworkImage(
                                  item.image.toString(),
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(item.fruit.toString(),
                            style: Theme.of(context).textTheme.bodyLarge),
                        SizedBox(height: 7),
                        Text(item.price.toString(),
                            style: Theme.of(context).textTheme.labelMedium),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          return Container(
            child: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
    // );
  }

  Future<dynamic> buildShowModalBottomSheet(
      BuildContext context, ProductDataModel item) {
    final SliderController sliderController = Get.put(SliderController());

    return showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      context: context,
      builder: (BuildContext context) => DraggableScrollableSheet(
        initialChildSize: 0.75,
        minChildSize: 0.2,
        maxChildSize: 0.75,
        expand: false,
          builder:  (_, BuildContext) => SingleChildScrollView(
            child: Container(
            color: Colors.white,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                      Container(
                        width: FHelperFunctions.screenWidth(),
                        height: FHelperFunctions.screenHeight() * 0.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                       image: DecorationImage(
                image: NetworkImage(
                            item.image.toString(),
                          ),
                            fit: BoxFit.cover,
                        ),
                          ),
                    ),
                    // ),
                    SizedBox(height: 7.0),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item.fruit.toString(), style: Theme.of(context).textTheme.headlineSmall),
                        SizedBox(height: 15),
                        Text('${item.details?.description ?? "null"}', style: Theme.of(context).textTheme.labelLarge),
                        SizedBox(height:15),
                        Text("Details", style: Theme.of(context).textTheme.headlineSmall),
                        SizedBox(height: 20),
                        Divider(height:5),
                        SizedBox(height: 20),
                        ContainerRowText(
                            leftText: "Expiration Date",
                            rightText: item.details!.expired ?? "null"),
                      SizedBox(height: 20),
                      Divider(height:5),
                      SizedBox(height: 20),
                        ContainerRowText(
                            leftText: "Price",
                            rightText: item.price.toString()
                        ),
                        SizedBox(height: 20),
                        Divider(height: 5),
                        SizedBox(height: 20),
                        ContainerRowText(
                            leftText: "Nutritional Facts",
                            rightText: item.details!.nutrision ?? "null"
                        ),
                        SizedBox(height: 25),
                        Container(
                          // padding: EdgeInsets.only(left: 15,right: 15 ),
                          width: double.infinity,
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                            Text("Quantity",
                            style: Theme.of(context).textTheme.titleMedium),

                            Obx(() => Text(sliderController.currentSliderValue.value.toInt().toString(),
                                  style: TextStyle(fontSize: 20))),
                            ],
                          ),
                        ),
                        Obx(() => Slider(
                        activeColor: Colors.black,
                        value: sliderController.currentSliderValue.value,
                        max: 3,
                        divisions: 3,
                        onChanged: (double value) {
                        sliderController.currentSliderValue.value = value;
                        },
                        ),),
                      SizedBox(height: 20),
                        Container(
                          padding: EdgeInsets.only(left: 15, bottom: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ButtonCartShop(
                                onPressed: (){},
                                text: "Add to Cart",
                                color: MaterialStateProperty.all(FColors.buttonPrimary)),
                              SizedBox(width: 10),
                              ButtonCartShop(
                                onPressed: onPressed,
                                text: "Buy Now",
                                color: MaterialStateProperty.all(FColors.buttonSecondary)
                              ),
                            ],
                          ),
                        )
                      ]
                    ),
                    ),
                  ],
                ),
            ),
          ),
      ),
        );
  }
}

class ButtonCartShop extends StatelessWidget {
  ButtonCartShop({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.color,
  });

  final VoidCallback onPressed;
  final String text;
  final MaterialStateProperty<Color> color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0)
            )
          ),
          backgroundColor: color,
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    );
  }
}

class ContainerRowText extends StatelessWidget {
  const ContainerRowText({
    super.key,
    required this.leftText,
    required this.rightText
  });

  final String leftText;
  final String rightText;

  @override
  Widget build(BuildContext context) {
    return Row(
      // Conta
      children: [
        Container(
        width: FHelperFunctions.screenWidth() * 0.2,
        child: Text(leftText, style: Theme.of(context).textTheme.labelSmall),
            ),
        SizedBox(width: FHelperFunctions.screenWidth() * 0.05),
        Container(
            width: FHelperFunctions.screenWidth() * 0.7,
            child: Text(rightText,
            style: Theme.of(context).textTheme.labelLarge)),
            ],
    );
  }
}






class ProductHeader extends StatelessWidget {
  ProductHeader({super.key, required this.onPressed});

  final RemoteProductDataSourceImpl _remoteProductDataSourceImpl =
      RemoteProductDataSourceImpl();
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // SizedBox(height: 12),
        FutureBuilder<List<ProductDataModel>>(
            future: _remoteProductDataSourceImpl.productData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Text('No data available');
              } else {
                List<ProductDataModel> items = snapshot.data!;
                return SingleChildScrollView(
                  controller: ScrollController(),
                  scrollDirection: Axis.horizontal,
                  clipBehavior: Clip.none,
                  child: Row(
                    children: List.generate(items.length, (index) {
                      var item = items[index];
                      return GestureDetector(
                        onTap: onPressed,
                        child: Container(
                          // padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: FColors.white,
                            borderRadius: BorderRadius.circular(6.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.03),
                                spreadRadius: 2,
                                blurRadius: 1,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          margin: const EdgeInsets.only(
                            right: 30.0,
                          ),
                          child: Container(
                            padding: EdgeInsets.only(bottom: 14),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: FHelperFunctions.screenWidth() * 0.92,
                                  height: FHelperFunctions.screenHeight() * 0.27,
                                  padding: EdgeInsets.only(bottom: 8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(6.0),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(6.0),
                                    child: Image.network(
                                      item.image.toString(),
                                      width: 100.0,
                                      height: 100.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 6),
                                Text(
                                  item.fruit.toString(),
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                                SizedBox(height: 5),
                                Text(
                                    item.home?.subtitle ?? "null",
                                  // item.home != null ? item.home!.subtitle.toString() : 'No subtitle available',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                );
              }
            }),
      ],
    );
  }
}
