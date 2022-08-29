import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:meal_notes/controllers/add_controller.dart';

class AddPage extends GetView<AddController> {
  final AddController c = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('식단 등록'),
        actions: [
          TextButton(
              onPressed: () {
                print('완료');
                Get.back();
              },
              child: Text('완료',
                  style: TextStyle(color: Colors.white70, fontSize: 24)))
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    width: 90,
                    height: 90,
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(4)),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(2),
                          child: IconButton(
                              onPressed: () async {
                                c.detectCameras();
                              }, icon: Icon(Icons.camera)),
                        ),
                        Text("0/10")
                      ],
                    ),
                  ),
                ],
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your username',
              ),
            ),
            Center(
              child: Text('hi'),
            ),
          ],
        ),
      ),
    );
  }
}
