import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/constants/colors.dart';
import '../../../../core/utils/helper/helper_functions.dart';
import '../../data/remote_data_source.dart';
import '../../model/data_model.dart';

class FCategoryTab extends StatelessWidget {
  FCategoryTab({super.key});

  final RemoteProductDataSourceImpl _remoteProductDataSourceImpl =
      RemoteProductDataSourceImpl();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
  padding: EdgeInsets.all(15.0),
            child: Column(
              children: [
                const SizedBox(height: 12),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text("Top Results",
                      style: Theme.of(context).textTheme.headlineSmall),
                ),
                const SizedBox(height: 27),
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
                        return Column(
                          children: List.generate(items.length, (index) {
                            var item = items[index];
                            return Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  // mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(item.fruit.toString(),
                                    style: Theme.of(context).textTheme.titleLarge),
                                    SizedBox(height: 10),
                                    Text("1kg",
                                    style: Theme.of(context).textTheme.bodySmall,),

                                    SizedBox(height: 18),
                                    TextButton(
                                      style: ButtonStyle(
                                        padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 16)),
                                          backgroundColor: MaterialStateProperty.all(FColors.buttonSecondary),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(15.0)
                                          ),
                                      ),
                                      ),
                                        onPressed: () {},
                                        child: Text(
                                          "Buy Now",
                                          style: Theme.of(context).textTheme.titleSmall,
                                        ))
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 40),
                                  height: 120,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(image: NetworkImage(
                                      item.image.toString(),
                                  ),
                                    fit: BoxFit.cover
                                  ),
                                  ),

                                ),
                                
                              ],
                            ),
                              // onTap: () {},

                                // height: 100,
                              // color: Colors.purple,
                              // child: Column(
                              //   children: [
                                  // Text("test"),
                                  // Text("test"),
                                  // Text("test"),
                                // ],

                                // padding: EdgeInsets.all(5),
                              //   decoration: BoxDecoration(
                              //     color: FColors.white,
                              //     borderRadius: BorderRadius.circular(6.0),
                              //     boxShadow: [
                              //       BoxShadow(
                              //         color: Colors.black.withOpacity(0.03),
                              //         spreadRadius: 2,
                              //         blurRadius: 1,
                              //         offset: Offset(0, 3),
                              //       ),
                              //     ],
                              //   ),
                              //   margin: const EdgeInsets.only(
                              //     right: 30.0,
                              //   ),
                              //   child: Container(
                              //     padding: EdgeInsets.only(bottom: 14),
                              //     child: Column(
                              //       crossAxisAlignment: CrossAxisAlignment.start,
                              //       children: [
                              //         Container(
                              //           width:
                              //               FHelperFunctions.screenWidth() * 0.92,
                              //           height: FHelperFunctions.screenHeight() *
                              //               0.27,
                              //           padding: EdgeInsets.only(bottom: 8),
                              //           decoration: BoxDecoration(
                              //             borderRadius:
                              //                 BorderRadius.circular(6.0),
                              //           ),
                              //           child: ClipRRect(
                              //             borderRadius:
                              //                 BorderRadius.circular(6.0),
                              //             child: Image.network(
                              //               item.image.toString(),
                              //               width: 100.0,
                              //               height: 100.0,
                              //               fit: BoxFit.cover,
                              //             ),
                              //           ),
                              //         ),
                              //         SizedBox(height: 6),
                              //         Text(
                              //           item.fruit.toString(),
                              //           style: Theme.of(context)
                              //               .textTheme
                              //               .headlineSmall,
                              //         ),
                              //         SizedBox(height: 5),
                              //         Text(
                              //           item.home?.subtitle ?? "null",
                              //           // item.home != null ? item.home!.subtitle.toString() : 'No subtitle available',
                              //           style:
                              //               Theme.of(context).textTheme.bodySmall,
                              //         ),
                              //       ],
                              //     ),
                              //   ),
                              // ),
                            );
                          }),
                        );
                      }
                    }),
              ],
            ),
          // )
        // ],
      );
    
  }
}
