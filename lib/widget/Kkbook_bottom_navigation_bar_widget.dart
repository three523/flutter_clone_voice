import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:kkobook_test_app/controller/bottom_navigation_bar_controller.dart';

class KkobookBottomNavigationBarWidget
    extends GetView<BottomNavigationBarController> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.star),
          label: '동화 만들기',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '홈',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.library_books),
          label: '내 책장',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.mic_external_off),
          label: '녹음',
        ),
      ],
      currentIndex: controller.currentIndex,
      onTap: controller.selectedIndex,
    );
  }
}
