import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kkobook_test_app/controller/bottom_navigation_bar_controller.dart';
import 'package:kkobook_test_app/controller/movie_controller.dart';
import 'package:kkobook_test_app/page/create_book_page.dart';
import 'package:kkobook_test_app/page/home_page.dart';
import 'package:kkobook_test_app/page/my_library_page.dart';
import 'package:kkobook_test_app/page/voice_record_page.dart';
import 'package:kkobook_test_app/widget/Kkbook_bottom_navigation_bar_widget.dart';

void main() {
  runApp(GetMaterialApp(
    home: MainPage(),
  ));
}

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final List<Widget> _bottomPageList = [
    CreateBookPage(),
    HomePage(),
    MyLibraryPage(),
    VoiceRecordPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomNavigationBarController>(
        init: BottomNavigationBarController(),
        builder: (navigationController) {
          return Scaffold(
              body: _bottomPageList[navigationController.currentIndex],
              bottomNavigationBar: KkobookBottomNavigationBarWidget());
        });
  }
}
