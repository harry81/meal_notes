import 'package:camera/camera.dart';
import 'package:get/get.dart';


class AddController extends GetxController {
  late List<CameraDescription> cameras;

  Future<void> detectCameras() async {
    cameras = await availableCameras();
    print(cameras);
  }
}
