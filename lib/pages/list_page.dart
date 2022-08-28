import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meal_notes/controllers/list_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meal_notes/models/item.dart';
import 'package:intl/intl.dart';

class ListPage extends GetView<ListController> {
  final ListController c = Get.put(ListController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Obx(() => Column(
            children: c.items.map((item) => ItemWidget(item: item)).toList())),
      ),
    );
  }
}

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({Key? key, required this.item}) : super(key: key);

  Color color_by_time() {
    int hour = this.item.created_at.hour;

    if (hour > 18) {
      return Colors.purple;
    } else if (hour > 12) {
      return Colors.orange;
    } else {
      return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(4, 8, 4, 4),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.grey.shade500,
              offset: Offset(4, 4),
              blurRadius: 15,
              spreadRadius: 1.0),
          BoxShadow(
              color: Colors.white,
              offset: Offset(-4, -4),
              blurRadius: 15,
              spreadRadius: 1.0),
        ], borderRadius: BorderRadius.circular(4), color: Colors.grey[300]),
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.fitWidth,
                image: NetworkImage(
                  this.item.image_url,
                ),
              )),
              margin: EdgeInsets.only(right: 2),
              child: Container(
                margin: EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '${this.item.title}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(4),
                height: MediaQuery.of(context).size.width * 0.3,
                margin: EdgeInsets.only(left: 4),
                color: Colors.white54,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 24,
                          height: 24,
                          margin: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: color_by_time(),
                              borderRadius: BorderRadius.circular(3)),
                        ),
                      ],
                    ),
                    Text(DateFormat("yy/mm/dd", "ko").format(this.item.created_at),
                        style: GoogleFonts.lato()),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
