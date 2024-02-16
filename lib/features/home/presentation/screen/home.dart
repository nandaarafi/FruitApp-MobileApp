

import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/constants/colors.dart';
import 'package:fruit_app/features/home/data/remote_data_source.dart';
import 'package:iconsax/iconsax.dart';


import '../../../../core/utils/helper/helper_functions.dart';
import '../../model/data_model.dart';

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
              SizedBox(height: 16),

              Text(
            "Product",
            style: Theme.of(context).textTheme.titleLarge,
            textAlign: TextAlign.left,
          ),
              ProductHeader(onPressed: (){}),
              SizedBox(height: 16),
              Text(
                "Latest Product",
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.left,
              ),
              GridViewVertical(onPressed: (){}),

            ],
          ),
        ),
      ),
    );
  }
}

//
// class GridViewVertical extends StatelessWidget {
//   ProductDataController controller = Get.put(ProductDataController());
//
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       controller: ScrollController(),
//         scrollDirection: Axis.vertical,
//         clipBehavior: Clip.none,
//
//       child: Obx(() {
//         print("Product Data List Length: ${controller.productDataList.length}");
//
//         // return SingleChildScrollView(
//         //   controller: ScrollController(),
//         //   scrollDirection: Axis.vertical,
//         //   clipBehavior: Clip.none,
//         return GridView.builder(
//           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2, // Adjust the number of columns as needed
//             crossAxisSpacing: 8.0, // Adjust the spacing between columns
//             mainAxisSpacing: 8.0, // Adjust the spacing between rows
//
//           ),
//
//           itemCount: controller.productDataList == null?0: controller.productDataList.length,
//           shrinkWrap: true,
//           physics: NeverScrollableScrollPhysics(),
//
//           // Disable scrolling for GridView
//
//           itemBuilder: (BuildContext context, int index) {
//             final product = controller.productDataList[index];
//             return GestureDetector(
//               onTap: () {
//                 // Handle item click
//               },
//               child: Container(
//
//                 margin: EdgeInsets.only(top: 12, right: 6, left: 6),
//                 padding: EdgeInsets.all(15),
//                 decoration: BoxDecoration(
//                   color: FColors.white,
//                   borderRadius: BorderRadius.circular(6.0),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.2),
//                       spreadRadius: 2,
//                       blurRadius: 5,
//                       offset: Offset(0, 3),
//                     ),
//                   ],
//                 ),
//
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Expanded(
//                       child: Container(
//                         width: FHelperFunctions.screenWidth(),
//                         clipBehavior: Clip.antiAlias,
//                         decoration: BoxDecoration(
//                           image: DecorationImage(
//                             image: NetworkImage(
//                               product.image.toString(),
//                             ),
//                             fit: BoxFit.cover,
//                           ),
//                           // borderRadius:
//                         ),
//                       ),
//                     ),
//
//                     Text(product.title.toString()),
//                     Text(product.subtitle.toString()),
//                     // Add other widgets if needed
//                   ],
//                 ),
//               ),
//             );
//           },
//         );
//       }
//       ),
//     );
//   }
// }

class GridViewVertical extends StatelessWidget {
   GridViewVertical({super.key,
    required this.onPressed,
  });


  final RemoteProductDataSourceImpl _remoteProductDataSourceImpl = RemoteProductDataSourceImpl();
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _remoteProductDataSourceImpl.productData(), // Use readApiData instead of ReadJsonData
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
                    onTap: onPressed,
                    child: Container(
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
                                    item.image.toString(),
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Text(item.title.toString()),
                          Text(item.subtitle.toString()),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          } else {
            return Container(
              child: Center(
                  child: CircularProgressIndicator()),
            );
          }
        },
      );
    // );
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


class ProductHeader extends StatelessWidget {
  ProductHeader({super.key,
  required this.onPressed});

  final RemoteProductDataSourceImpl _remoteProductDataSourceImpl = RemoteProductDataSourceImpl();
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 12),
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
                    margin: const EdgeInsets.only(
                      right: 12.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 100.0,
                          height: 100.0,
                          decoration: BoxDecoration(
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
                          item.title.toString(),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        SizedBox(height: 5),
                        Text(
                              item.subtitle.toString(),
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          );
        }
          }
          ),
      ],
    );
  }
}


