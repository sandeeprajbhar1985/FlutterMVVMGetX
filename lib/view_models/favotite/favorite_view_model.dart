import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../models/home/user_list_model.dart';

class FavouiteViewModel extends GetxController {
  RxList favUserList = [].obs;

  void addFavItem(Data value) {
    favUserList.add(value);
  }

  void removeFavItem(Data value) {
    favUserList.removeWhere((item) => item.id == value.id);
  }
}
