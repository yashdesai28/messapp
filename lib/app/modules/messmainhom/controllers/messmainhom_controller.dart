import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessmainhomController extends GetxController {
  //TODO: Implement MessmainhomController

 
  
  late PageController pageController;

  RxInt currentpage=0.obs;

  void gototab(int page){
    currentpage.value=page;
    pageController.jumpToPage(page);

  }

  void gotopage(int page){
    currentpage.value=page;
    //pageController.jumpToPage(page);

  }



  final count = 0.obs;
  @override
  void onInit() {
    pageController=PageController(initialPage:0);
    super.onInit();
  }


  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
