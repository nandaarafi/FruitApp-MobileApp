
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruit_app/core/error/exceptions.dart';
import 'package:fruit_app/core/utils/constants/colors.dart';
import 'package:fruit_app/features/home/data/remote_data_source.dart';
import 'package:fruit_app/features/home/presentation/controller/home_controller.dart';
import 'package:fruit_app/features/home/presentation/screen/detail_product.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';


class FAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FAppBar({
    super.key,
    required this.title,
    required this.showBackArrow,
    // required this.leadingIcon,
    // required this.actions,
    // required this.leadingOnPressed,
  });

  final Widget title;
  final bool showBackArrow;
  // final IconData? leadingIcon;
  // final List<Widget>? actions;
  // final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: AppBar(
        // backgroundColor: Colors.white,
        elevation: 0.0,
        title: title,
        // style: Theme.of(context).textTheme.headlineLarge,),
        leading: showBackArrow
            ? IconButton(
            onPressed: () => Get.back(), icon: Icon(Iconsax.arrow_left))
            // : leadingIcon != null
            // ? IconButton(onPressed: leadingOnPressed, icon: Icon(leadingIcon))
            : null,
        // leadingWidth: 1,
        titleTextStyle: Theme
            .of(context)
            .textTheme
            .headlineMedium,
        actions: [
          Badge(
            label: const Text(
              "4",
              style: TextStyle(color: FColors.white),
            ),
            child: const Icon(Iconsax.notification, size: 32),
          ),

        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

}