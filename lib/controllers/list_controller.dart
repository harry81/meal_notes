import 'package:get/get.dart';
import 'package:meal_notes/models/item.dart';

class ListController extends GetxController {
  List<Item> items = [
    Item(
        "김밥",
        "https://4.bp.blogspot.com/-9KMlx0tx-zo/VVsVN4tYJ6I/AAAAAAAAlf0/mmlS1EiXYbg/s640/15834615023_8d34817e2b_o.jpg",
        DateTime.utc(2015, 9, 4, 11, 10, 10)),
    Item(
        "돈가스",
        "https://images.pexels.com/photos/1624487/pexels-photo-1624487.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
        DateTime.utc(2015, 3, 4, 14, 30)),
    Item(
        "삼겹살",
        "https://watermark.lovepik.com/photo/20211208/large/lovepik-japanese-style-grilled-pork-belly-picture_501605503.jpg",
        DateTime.utc(2015, 3, 4, 19, 30)),
  ].obs;
}
