import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_notes/controllers/profile_controller.dart';

class ProfilePage extends GetView<ProfileController> {
  final ProfileController c = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Obx(() => Text("profile ${c.count}")),
              ElevatedButton(
                  onPressed: () {
                    c.increment();
                  },
                  child: Icon(Icons.add)),
              ElevatedButton(
                  onPressed: () {
                    c.decrement();
                  },
                  child: Icon(Icons.remove)),
            ],
          ),
        ),
      ),
    );
  }
}
