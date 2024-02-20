import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';

class DetailPage extends StatelessWidget {
  DetailPage({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
          onPressed: (){
            Get.back();
          },
            icon: Icon(Iconsax.arrow_left),
          ),
        ),
        ));
  }
}