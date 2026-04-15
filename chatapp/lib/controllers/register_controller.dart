import 'package:get/get.dart';
import '../services/api_service.dart';

class RegisterController extends GetxController {
  var isLoading = false.obs;

  Future<bool> register(String username, String phone, String password) async {
    try {
      isLoading.value = true;
      final response = await ApiService.register(username, phone, password);

      print(response);

      if (response['status'] == 'success') {
        Get.snackbar('Success', response['message']);
        return true;
      } else {
        Get.snackbar('Error', response['message'] ?? 'Registration failed');
        return false;
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred: $e');
      return false;
    } finally {
      isLoading.value = false;
    }
  }
}
