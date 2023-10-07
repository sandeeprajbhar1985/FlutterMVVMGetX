import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserDetailView extends StatefulWidget {
  const UserDetailView({super.key});

  @override
  State<UserDetailView> createState() => _UserDetailViewState();
}

class _UserDetailViewState extends State<UserDetailView> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.amber,
        appBar: AppBar(
          centerTitle: true,
          title: Text(Get.arguments.firstName),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Image.network(
                  Get.arguments.avatar.toString(),
                  errorBuilder: (context, error, stack) {
                    return const Icon(
                      Icons.error,
                      color: Colors.red,
                    );
                  },
                ),
                SizedBox(height: 16),
                Text(Get.arguments.firstName!),
                SizedBox(height: 16),
                Text(Get.arguments.lastName!),
                SizedBox(height: 16),
                Text(Get.arguments.email!),
              ],
            ),
          ],
        ));
  }
}
