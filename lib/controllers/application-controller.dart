import 'package:get/get.dart';

class ApplicationController extends GetxController {
  static final imageBaseUrl = "https://merooffer.com/upsize_images/";
  static final imageBaseUrlWithWaterMark = "https://merooffer.com/watermark/";

  static RxString current_layout = "Grid".obs;
}
