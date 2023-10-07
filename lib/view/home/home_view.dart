import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/response/status.dart';
import '../../res/components/general_exception.dart';
import '../../res/components/internet_exceptions_widget.dart';
import '../../res/routes/routes_name.dart';
import '../../utils/utils.dart';
import '../../view_models/favotite/favorite_view_model.dart';
import '../../view_models/home/home_view_models.dart';
import '../../view_models/user_preference/user_prefrence_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final homeController = Get.put(HomeController());
  final favouiteViewModel = Get.put(FavouiteViewModel());

  UserPreference userPreference = UserPreference();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    homeController.userListApi();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('users'.tr),
      ),
      body: Obx(() {
        switch (homeController.rxRequestStatus.value) {
          case Status.LOADING:
            return const Center(child: CircularProgressIndicator());
          case Status.ERROR:
            if (homeController.error.value == 'No internet') {
              return InterNetExceptionWidget(
                onPress: () {
                  homeController.refreshApi();
                },
              );
            } else {
              return GeneralExceptionWidget(onPress: () {
                homeController.refreshApi();
              });
            }
          case Status.COMPLETED:
            return ListView.builder(
                itemCount: homeController.userList.value.data!.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      onTap: () => {
                        Get.toNamed(RouteName.userdetailview,
                            arguments:
                                homeController.userList.value.data![index])
                      },
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(homeController
                            .userList.value.data![index].avatar
                            .toString()),
                      ),
                      title: Text(homeController
                          .userList.value.data![index].firstName
                          .toString()),
                      subtitle: Text(homeController
                          .userList.value.data![index].email
                          .toString()),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Obx(() => IconButton(
                                icon: const Icon(Icons.favorite),
                                color: Utils.getAllIds(
                                            favouiteViewModel.favUserList)
                                        .contains(homeController
                                            .userList.value.data![index].id)
                                    ? Colors.black
                                    : Colors.red,
                                onPressed: () {
                                  Utils.getAllIds(favouiteViewModel.favUserList)
                                          .contains(homeController
                                              .userList.value.data![index].id)
                                      ? favouiteViewModel.removeFavItem(
                                          homeController
                                              .userList.value.data![index])
                                      : favouiteViewModel.addFavItem(
                                          homeController
                                              .userList.value.data![index]);
                                },
                              ))
                        ],
                      ),
                    ),
                  );
                });
        }
      }),
    );
  }
}
