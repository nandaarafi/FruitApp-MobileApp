import 'package:flutter/material.dart';
import 'package:fruit_app/core/utils/constants/colors.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../core/config/navigation_bar.dart';
import '../../../../core/utils/helper/helper_functions.dart';
import '../controller/onboarding_controller.dart';
import '../widgets/checkbox_theme.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 120, bottom: 24, left: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome back,',
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.left,
              ),
              Text(
                'Discover Limitless Choices and Unmatched Convenience.',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 30),
              FormFieldSignIn(),
            ],
          ),
        ),
      ),
    );
  }
}

class FormFieldSignIn extends StatelessWidget {
  const FormFieldSignIn({
    super.key,
  });
  // bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    final AuthScreenController controller = Get.put(AuthScreenController());
    final TextEditingController emailController = TextEditingController();

    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            // Email
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: 'Email',
                  border: InputBorder.none),
            ),
            // const SizedBox(height: EcomSizes.spaceBtwInputSignIn),

            //Password
            GetBuilder<AuthScreenController>(builder: (controller) {
              return TextFormField(
                obscureText: /*false*/ !controller.showPassword.value,
                decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.password_check),
                    labelText: 'Password',
                    suffixIcon: IconButton(
                      onPressed: () {
                        print(controller.showPassword.value);
                        controller.togglePasswordVisibility();
                      },
                      icon: Icon(
                        controller.showPassword.value
                            ? Iconsax.eye
                            : Iconsax.eye_slash,
                      ),
                    ),
                    border: InputBorder.none),
              );
            }),
            const SizedBox(height: 24),

            //Remember me & Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // RememberMe

                Row(
                  children: [
                    GetBuilder<AuthScreenController>(builder: (controller) {
                      /*Obx(() => */ return Checkbox(
                        checkColor: Colors.white,
                        fillColor:
                            FCheckboxTheme.lightCheckboxTheme.fillColor,
                        shape: FCheckboxTheme.lightCheckboxTheme.shape,
                        value: controller.isChecked.value,
                        onChanged: (bool? stateRememberMe) {
                          // print(StateRememberMe);
                          controller.toggleCheckbox();
                        },
                      );
                    }),
                    const Text('Remember Me'),
                  ],
                ),

                //Forget Password
                TextButton(
                  onPressed: () {
                    // Get.to(() => ForgotPassScreen());
                  },
                  child: const Text(
                    'Forget Password',
                    textAlign: TextAlign.right,
                    style: TextStyle(color: FColors.primary),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            //SignIn Button
            SizedBox(
              width: double.infinity,
              height: FHelperFunctions.screenHeight() / 16,
              child: ElevatedButton(
                  onPressed: () {
                    Get.to(() => NavigationMenu());
                    ///Firebase Action

                    // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginWithPassScreen()));
                    // print("Sign In Clicked");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: FColors.buttonPrimary,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Sign In',
                    style: TextStyle(color: FColors.white),
                  )),
            ),
            const SizedBox(height: 24),

            //CreatedAccountLink
            Text(
              "Don't have an account?",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 5),

            GestureDetector(
              onTap: () {
                controller.GoSignUpPage();
                // print("Create Account : clicked");
              },
              child: const Text(
                "Create Account",
                textAlign: TextAlign.center,
                style: TextStyle(color: FColors.primary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
