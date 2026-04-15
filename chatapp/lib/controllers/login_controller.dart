import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../services/api_service.dart';
import '../models/user_model.dart';

class LoginController extends GetxController {
  final storage = GetStorage();
  var isLoading = false.obs;
  var currentUser = Rxn<UserModel>();

  @override
  void onInit() {
    super.onInit();
    var userData = storage.read('user');
    if (userData != null) {
      currentUser.value = UserModel.fromJson(userData);
    }
  }

  Future<bool> login(String username, String password) async {
    try {
      isLoading.value = true;
      final response = await ApiService.login(username, password);

      print(response);

      if (response['status'] == 'success') {
        currentUser.value = UserModel.fromJson(response['user']);
        await storage.write('user', currentUser.value!.toJson());
        await storage.write('token', currentUser.value!.token);
        Get.snackbar('Success', response['message']);

        return true;
      } else {
        Get.snackbar('Error', response['message'] ?? 'Login failed');
        return false;
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  void logout() {
    storage.remove('user');
    storage.remove('token');
    currentUser.value = null;
    Get.offAllNamed('/login');
  }
}
