import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/constants/colors.dart';
import 'package:fruit_app/features/home/data/remote_data_source.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
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
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const SizedBox(height: 1),
              SearchBarApp(),
              const SizedBox(height: 20),
              // Text(
              //   "Product",
              //   style: Theme.of(context).textTheme.titleLarge,
              //   textAlign: TextAlign.left,
              // ),
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

class SearchBarApp extends StatefulWidget {
  const SearchBarApp({super.key});

  @override
  State<SearchBarApp> createState() => _SearchBarAppState();
}

class _SearchBarAppState extends State<SearchBarApp> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SizedBox(
        height: 43,
        child: SearchAnchor(
          builder: (BuildContext context, SearchController controller) {
            return SearchBar(
              backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 255, 255, 255)),
              textStyle: MaterialStateProperty.all(Theme.of(context).textTheme.bodySmall),
              shape: MaterialStateProperty.all(const ContinuousRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))
              )),
              controller: controller,
              onTap: () {
                controller.openView();
              },
              onChanged: (_) {
                controller.openView();
              },
              leading: const Icon(Icons.search),
              trailing: <Widget>[
                // Add icon in the right search bar
              ],
              // Set border radius and hint
              // decoration: InputDecoration(
              //   contentPadding: EdgeInsets.symmetric(vertical: 12.0),
              //   border: OutlineInputBorder(
              //     borderRadius: BorderRadius.circular(20.0), // Set border radius
              //   ),
              hintText: 'Search fruits, nuts, and more', // Set hint text
              // fillColor: MaterialStateProperty.resolveWith((states) {
              //   // Set background color
              //   if (states.contains(MaterialState.disabled)) {
              //     return Colors.grey; // You can change this to your desired disabled color
              //   }
              //   return Colors.white; // Default color
              // }),
            );
          },
          suggestionsBuilder: (BuildContext context,
              SearchController controller) {
            return List<ListTile>.generate(5, (int index) {
              final String item = 'item $index';
              return ListTile(
                title: Text(item),
                onTap: () {
                  controller.closeView(item);
                },
              );
            });
          },
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
                  onTap: onPressed,
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
                        Text(item.title.toString(),
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
}

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    elevation: 0.0,
    title: Text("Fruitful"),
    // style: Theme.of(context).textTheme.headlineLarge,),
    leading: Container(),
    leadingWidth: 0.0,
    titleTextStyle: Theme.of(context).textTheme.headlineMedium,
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
                                    boxShadow: [
                                      // BoxShadow(
                                      //   color: Colors.black.withOpacity(0.2),
                                      //   spreadRadius: 2,
                                      //   blurRadius: 5,
                                      //   offset: Offset(0, 3),
                                      // ),
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
                                  style: Theme.of(context).textTheme.headlineSmall,
                                ),
                                SizedBox(height: 5),
                                Text(
                                  item.subtitle.toString(),
                                  style: Theme.of(context).textTheme.bodySmall,
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
