import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx/view_models/favotite/favorite_view_model.dart';

import '../../res/routes/routes_name.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  final favouiteViewModel = Get.put(FavouiteViewModel());

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text('favorite'.tr),
      ),
      body: Obx(() => ListView.builder(
          itemCount: favouiteViewModel.favUserList.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                onTap: () => {
                  Get.toNamed(RouteName.userdetailview,
                      arguments: favouiteViewModel.favUserList[index])
                },
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      favouiteViewModel.favUserList[index].avatar.toString()),
                ),
                title: Text(
                    favouiteViewModel.favUserList[index].firstName.toString()),
                subtitle:
                    Text(favouiteViewModel.favUserList[index].email.toString()),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.favorite),
                      color: Colors.black,
                      onPressed: () {
                        favouiteViewModel.removeFavItem(
                            favouiteViewModel.favUserList[index]);
                      },
                    )
                  ],
                ),
              ),
            );
          })),
    );
  }
}
