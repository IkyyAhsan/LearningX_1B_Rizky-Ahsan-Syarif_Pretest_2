import 'package:get/get.dart';
import 'package:pretest_2/app/modules/home/model/home_model.dart';

class restaurantProvider extends GetConnect {
  final filter = Get.arguments;
  Future<Restaurants> getRestaurant() async {
    final response = await get(
        'https://randomuser.me/api/');
    if (response.status.hasError) {
      return Future.error(response.statusText!);
    } else {
      return Restaurants.fromJson(response.body as Map<String, dynamic>);
    }
  }
}
