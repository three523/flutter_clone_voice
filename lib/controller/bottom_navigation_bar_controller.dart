import 'package:get/get_state_manager/get_state_manager.dart';

class BottomNavigationBarController extends GetxController {
  int currentIndex = 0;

  void selectedIndex(int index) {
    currentIndex = index;
    update();
  }
}
