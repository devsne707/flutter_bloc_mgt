import 'package:flutter_bloc_mgt/api_repository.dart';
import 'package:get/get.dart';

class APIController extends GetxController {
   static APIController get to => Get.find<APIController>();

  UserRepository repo  = UserRepository();
  RxList getUser = [].obs;
  RxBool isLoading = false.obs;

  getUserData() async {
    isLoading.value = true;
    getUser.value = await repo.getUsers().whenComplete(() => isLoading.value = false);
    update();
  }

}