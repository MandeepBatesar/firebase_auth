import 'package:firebase_authntication/Controller/UserController.dart';
import 'package:get/get.dart';

class AppInitialbinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UserController());
  }
}
