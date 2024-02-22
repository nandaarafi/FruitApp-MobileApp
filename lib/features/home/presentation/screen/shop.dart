import 'package:flutter/material.dart';
import 'package:fruit_app/core/error/exceptions.dart';
import 'package:fruit_app/core/utils/constants/colors.dart';
import 'package:fruit_app/features/home/data/remote_data_source.dart';
import 'package:fruit_app/features/home/presentation/controller/home_controller.dart';
import 'package:fruit_app/features/home/presentation/screen/detail_product.dart';
import 'package:fruit_app/features/home/presentation/widgets/app_bar.dart';
import 'package:fruit_app/features/home/presentation/widgets/tab_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';
import '../../../../core/utils/helper/helper_functions.dart';
import '../../model/data_model.dart';
import '../widgets/category_tab.dart';
import '../widgets/search_bar.dart';


class ShopScreen extends StatelessWidget {
  const ShopScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      // child: SafeArea(
        // maintainBottomViewPadding: false,
        child: Scaffold(
          // appBar: FAppBar(title: Text("Shop"), showBackArrow: false),
          body: NestedScrollView(
            headerSliverBuilder: (_, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  surfaceTintColor: Colors.white,
                  collapsedHeight: 80,
                  pinned: true,
                  floating: true,
                  expandedHeight: 130.0,
                  automaticallyImplyLeading: false,
                  backgroundColor: Colors.white,// Set the height of the app bar when expanded
                  flexibleSpace:
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          const SizedBox(height: 16),
                          SearchBarApp(text: "Search for fruits, vegetables...", padding: EdgeInsets.symmetric(horizontal: 10))
                        ],
                      ),
                    ),

      
                  bottom:  TabBar(
                    tabAlignment: TabAlignment.start,
                      labelStyle: Theme.of(context).textTheme.titleMedium,
                      isScrollable: true,
                      indicatorColor: Colors.greenAccent,
                      unselectedLabelColor: FColors.primary,
                      labelColor: Colors.black,
                      tabs:[
                  Tab(child: Text("Fruits")),
                  Tab(child: Text("Vegetables")),
                  Tab(child: Text("Nuts")),
                  Tab(child: Text("Berries")),
      ]
                  ) ,
                ),
              ];
            },
            body: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                FCategoryTab(),
                FCategoryTab(),
                FCategoryTab(),
                FCategoryTab(),
              ],
            ),
          ),
        ),
      // ),
    );
  }
}