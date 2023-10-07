import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx/view/login/widgets/input_email_widget.dart';
import 'package:mvvm_getx/view/login/widgets/input_password_widget.dart';
import 'package:mvvm_getx/view/login/widgets/login_button_widget.dart';
import '../../view_models/login/login_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final loginVM = Get.put(LoginViewModel());
  final _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text('login'.tr),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Form(
              key: _formkey,
              child: Column(
                children: [
                  InputEmailWidget(),
                  const SizedBox(
                    height: 20,
                  ),
                  InputPasswordWidget(),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            LoginButtonWidget(
              formKey: _formkey,
            )
          ],
        ),
      ),
    );
  }
}
