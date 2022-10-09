import 'package:pintando_carro/modules/home/repositories/home_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var isLoading = false.obs;

  HomeController() {
    getData();
  }

  getData() async {
    isLoading.value = true;
    await HomeRepository.updateData();
    isLoading.value = false;
  }
}
