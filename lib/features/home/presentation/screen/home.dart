import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/constants/colors.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart' as rootBundle;


import '../../../../core/utils/helper/helper_functions.dart';
import '../../model/datamodel.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GridViewVertical(onPressed: () {}),

            ],
          ),
        ),
      ),
    );
  }
}



class GridViewVertical extends StatelessWidget {
  const GridViewVertical({
    super.key,
    required this.onPressed,
  });
  Future<List<ProductDataModel>> ReadJsonData() async {
    final jsondata = await rootBundle.rootBundle.loadString(
        'lib/features/home/data/productdata.json');
    final list = json.decode(jsondata) as List<dynamic>;

    return list.map((e) => ProductDataModel.fromJson(e)).toList();
  }
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: FutureBuilder(
          future: ReadJsonData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text("${snapshot.error}"));
            } else if (snapshot.hasData) {
              List<ProductDataModel> latestProduct = snapshot.data as List<
                  ProductDataModel>;
              return SingleChildScrollView(
                controller: ScrollController(),
                scrollDirection: Axis.vertical,
                clipBehavior: Clip.none,
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // Adjust the number of columns as needed
                    crossAxisSpacing: 8.0, // Adjust the spacing between columns
                    mainAxisSpacing: 8.0, // Adjust the spacing between rows

                  ),
                  itemCount: latestProduct == null ? 0 : latestProduct.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  // Disable scrolling for GridView

                  itemBuilder: (BuildContext context, int index) {
                    var item = latestProduct[index];
                    return Container(
                      margin: EdgeInsets.only(top: 12, right: 6, left: 6),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: FColors.white,
                        borderRadius: BorderRadius.circular(6.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
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
                                image: DecorationImage(
                                  image: NetworkImage(
                                    latestProduct[index].imageURL.toString(),
                                  ),
                                  fit: BoxFit.cover,
                                ),
                                // borderRadius:
                              ),
                            ),
                          ),

                          // Image.network(
                          //   item["image"],
                          //   width: 100.0,
                          //   height: 100.0,
                          //   fit: BoxFit.cover,
                          // ),
                          Text(latestProduct[index].title.toString()),
                          Text(latestProduct[index].subtitle.toString()),
                          // Add other widgets if needed
                        ],
                      ),
                    );
                  },
                ),
              );
            }
            else {
              return Center(child: CircularProgressIndicator(),);
            }
          }
      ),
    );
  }
}

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      title: const Text("FruitDashboard"),
      leading: Container(),
      leadingWidth: 0.0,
      titleTextStyle: Theme
          .of(context)
          .textTheme
          .headlineMedium,
      actions: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Badge(
            label: const Text(
              "4",
              style: TextStyle(color: FColors.white),
            ),
            child: const Icon(Iconsax.notification, size: 32),
          ),
        ),
      ],
    );
  }

//
// class ProductHeader extends StatelessWidget {
//   final List<Map<String, String>> items;
//
//   const ProductHeader({Key? key, required this.items}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Text(
//           "Product",
//           style: Theme.of(context).textTheme.titleLarge,
//           textAlign: TextAlign.left,
//         ),
//         SizedBox(height: 12),
//         GetBuilder<HomeScreenController>(builder: (controller) {
//           return SingleChildScrollView(
//             controller: ScrollController(),
//             scrollDirection: Axis.horizontal,
//             clipBehavior: Clip.none,
//             child: Row(
//               children: List.generate(items.length, (index) {
//                 var item = items[index];
//                 return Container(
//                   padding: EdgeInsets.all(15),
//                   decoration: BoxDecoration(
//                     color: FColors.white,
//                     borderRadius: BorderRadius.circular(6.0),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.2),
//                         spreadRadius: 2,
//                         blurRadius: 5,
//                         offset: Offset(0, 3),
//                       ),
//                     ],
//                   ),
//                   margin: const EdgeInsets.only(
//                     right: 12.0,
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         width: 100.0,
//                         height: 100.0,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(6.0),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black.withOpacity(0.2),
//                               spreadRadius: 2,
//                               blurRadius: 5,
//                               offset: Offset(0, 3),
//                             ),
//                           ],
//                         ),
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(6.0),
//                           child: Image.network(
//                             item["image"]!,
//                             width: 100.0,
//                             height: 100.0,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 6),
//                       Text(
//                         item["title"]!,
//                         style: Theme.of(context).textTheme.bodyMedium,
//                       ),
//                       SizedBox(height: 5),
//                       Text(
//                         item["subtitle"]!,
//                         style: Theme.of(context).textTheme.titleMedium,
//                       ),
//                     ],
//                   ),
//                 );
//               }),
//             ),
//           );
//         }),
//       ],
//     );
//   }
// }


