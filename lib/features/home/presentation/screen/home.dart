import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/constants/colors.dart';
import 'package:fruit_app/features/home/presentation/controller/home_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../../../core/utils/helper/helper_functions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> items = [
      {
        "image":
        "https://plus.unsplash.com/premium_photo-1671379528112-7b19c77a1d58?q=80&w=1881&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "title": "Apple",
        "subtitle": "Rp50000",
      },
      {
        "image":
        "https://images.unsplash.com/photo-1589217157232-464b505b197f?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "title": "Orange",
        "subtitle": "Rp50000",
      },
      {
        "image":
        "https://images.unsplash.com/photo-1580052614034-c55d20bfee3b?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "title": "Apple",
        "subtitle": "Rp50000",
      },
      {
        "image":
        "https://images.unsplash.com/photo-1592457765434-70aacc2da743?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "title": "Apple",
        "subtitle": "Rp50000",
      },
      {
        "image":
        "https://plus.unsplash.com/premium_photo-1671379528112-7b19c77a1d58?q=80&w=1881&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "title": "Apple",
        "subtitle": "Rp50000",
      },
      {
        "image":
        "https://images.unsplash.com/photo-1589217157232-464b505b197f?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "title": "Orange",
        "subtitle": "Rp50000",
      },
      {
        "image":
        "https://images.unsplash.com/photo-1580052614034-c55d20bfee3b?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "title": "Apple",
        "subtitle": "Rp50000",
      },
      {
        "image":
        "https://images.unsplash.com/photo-1592457765434-70aacc2da743?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        "title": "Apple",
        "subtitle": "Rp50000",
      },
    ];
    final controller = Get.put(HomeScreenController());
///Latest transaction by date 3 hari 5 7 30
    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductHeader(items: [
                {
                  "image":
                  "https://plus.unsplash.com/premium_photo-1671379528112-7b19c77a1d58?q=80&w=1881&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                  "title": "Apple",
                  "subtitle": "Rp50000",
                },
                {
                  "image":
                  "https://images.unsplash.com/photo-1589217157232-464b505b197f?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                  "title": "Orange",
                  "subtitle": "Rp50000",
                },
                {
                  "image":
                  "https://images.unsplash.com/photo-1580052614034-c55d20bfee3b?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                  "title": "Apple",
                  "subtitle": "Rp50000",
                },
                {
                  "image":
                  "https://images.unsplash.com/photo-1592457765434-70aacc2da743?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                  "title": "Apple",
                  "subtitle": "Rp50000",
                },
                {
                  "image":
                  "https://plus.unsplash.com/premium_photo-1671379528112-7b19c77a1d58?q=80&w=1881&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                  "title": "Apple",
                  "subtitle": "Rp50000",
                },
                {
                  "image":
                  "https://images.unsplash.com/photo-1589217157232-464b505b197f?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                  "title": "Orange",
                  "subtitle": "Rp50000",
                },
                {
                  "image":
                  "https://images.unsplash.com/photo-1580052614034-c55d20bfee3b?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                  "title": "Apple",
                  "subtitle": "Rp50000",
                },
                {
                  "image":
                  "https://images.unsplash.com/photo-1592457765434-70aacc2da743?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                  "title": "Apple",
                  "subtitle": "Rp50000",
                },
              ]),
              SizedBox(height: 24),
              Text(
                "Latest Product",
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.left,
              ),
              LatestProductFooter(),
            ],
          ),
        ),
      ),
    );
  }
}

class LatestProductFooter extends StatelessWidget {
  const LatestProductFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeScreenController>(builder: (controller) {
      List items = [
        {
          "image":
              "https://plus.unsplash.com/premium_photo-1671379528112-7b19c77a1d58?q=80&w=1881&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          "title": "Apple",
          "subtitle": "Rp50000",
        },
        {
          "image":
              "https://images.unsplash.com/photo-1589217157232-464b505b197f?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          "title": "Orange",
          "subtitle": "Rp50000",
        },
        {
          "image":
              "https://images.unsplash.com/photo-1580052614034-c55d20bfee3b?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          "title": "Apple",
          "subtitle": "Rp50000",
        },
        {
          "image":
              "https://images.unsplash.com/photo-1592457765434-70aacc2da743?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          "title": "Apple",
          "subtitle": "Rp50000",
        },
        {
          "image":
              "https://plus.unsplash.com/premium_photo-1671379528112-7b19c77a1d58?q=80&w=1881&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          "title": "Apple",
          "subtitle": "Rp50000",
        },
        {
          "image":
              "https://images.unsplash.com/photo-1589217157232-464b505b197f?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          "title": "Orange",
          "subtitle": "Rp50000",
        },
        {
          "image":
              "https://images.unsplash.com/photo-1580052614034-c55d20bfee3b?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          "title": "Apple",
          "subtitle": "Rp50000",
        },
        {
          "image":
              "https://images.unsplash.com/photo-1592457765434-70aacc2da743?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          "title": "Apple",
          "subtitle": "Rp50000",
        },
      ];
      final latestProduct = items;
      print(items.length);
      return SingleChildScrollView(
        controller: ScrollController(),
        scrollDirection: Axis.vertical,
        clipBehavior: Clip.none,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:
                2, // Adjust the number of columns as needed
            crossAxisSpacing:
                8.0, // Adjust the spacing between columns
            mainAxisSpacing: 8.0, // Adjust the spacing between rows

          ),
          itemCount: latestProduct.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(), // Disable scrolling for GridView

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
                            item["image"],
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
                  Text(item["title"]),
                  Text(item["subtitle"]),
                  // Add other widgets if needed
                ],
              ),
            );
          },
        ),
      );
    });
  }
}

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    elevation: 0.0,
    title: const Text("FruitDashboard"),
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
  final List<Map<String, String>> items;

  const ProductHeader({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Product",
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 12),
        GetBuilder<HomeScreenController>(builder: (controller) {
          return SingleChildScrollView(
            controller: ScrollController(),
            scrollDirection: Axis.horizontal,
            clipBehavior: Clip.none,
            child: Row(
              children: List.generate(items.length, (index) {
                var item = items[index];
                return Container(
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
                            item["image"]!,
                            width: 100.0,
                            height: 100.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        item["title"]!,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(height: 5),
                      Text(
                        item["subtitle"]!,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                );
              }),
            ),
          );
        }),
      ],
    );
  }
}
