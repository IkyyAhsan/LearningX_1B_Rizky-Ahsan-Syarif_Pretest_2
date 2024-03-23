import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeController extends GetxController {
 
  var isLoading = true.obs;
  var dataList = [].obs;

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  void fetchData() async {
    try {
      isLoading(true);
      var response = await http.get(Uri.parse('https://randomuser.me/api/'));
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        dataList.assignAll(data['results']);
      } else {
        print('Failed to load data');
      }
    } finally {
      isLoading(false);
    }
  }
}