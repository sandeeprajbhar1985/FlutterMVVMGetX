import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx/view_models/theme/theme_view_model.dart';
import '../../res/routes/routes_name.dart';
import '../../view_models/user_preference/user_prefrence_view_model.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  UserPreference userPreference = UserPreference();
  final themeChanger = Get.put(ThemeChanger());

  void _showActionSheet(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: const Text('Change Lanuguage'),
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            /// This parameter indicates the action would be a default
            /// defualt behavior, turns the action's text to bold text.
            isDefaultAction: true,
            onPressed: () {
              themeChanger.saveCurrentLanguage('English');
              Navigator.pop(context);
            },
            child: const Text('English'),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              themeChanger.saveCurrentLanguage('Urdu');
              Navigator.pop(context);
            },
            child: const Text('Urdu'),
          ),
          CupertinoActionSheetAction(
            /// This parameter indicates the action would perform
            /// a destructive action such as delete or exit and turns
            /// the action's text color to red.
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print('object');
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text('settngs'.tr),
      ),
      body: ListView(
        children: [
          ListTile(
              title: Text('light_mode'.tr),
              trailing: Obx(() => Switch(
                    // This bool value toggles the switch.
                    value: themeChanger.isLightTheme.value,
                    activeColor: Colors.black,
                    onChanged: (bool value) {
                      // This is called when the user toggles the switch.
                      themeChanger.isLightTheme.value = value;
                      Get.changeThemeMode(
                        themeChanger.isLightTheme.value
                            ? ThemeMode.light
                            : ThemeMode.dark,
                      );
                      themeChanger.saveThemeStatus();
                    },
                  ))),
          ListTile(
            title: Text('sign_out'.tr),
            onTap: () => {
              Get.dialog(
                AlertDialog(
                  title: const Text('Alert'),
                  content: const Text('Are you sure , you want to logOut?'),
                  actions: [
                    TextButton(
                      child: const Text("Ok"),
                      onPressed: () {
                        userPreference.removeUser().then((value) {
                          Get.toNamed(RouteName.loginView);
                        });
                        Get.back();
                      },
                    ),
                    TextButton(
                      child: const Text("Cancel"),
                      onPressed: () => Get.back(),
                    ),
                  ],
                ),
              )
            },
          ),
          ListTile(
            title: Text('language'.tr),
            trailing:
                Obx(() => Text(themeChanger.currentSelectedLanguage.value)),
            onTap: () => _showActionSheet(context),
          ),
        ],
      ),
    );
  }
}
