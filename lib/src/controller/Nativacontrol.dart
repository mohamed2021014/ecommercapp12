import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Nativacontrol extends GetxController {
  var nativation = [].obs; // قائمة العناصر المفضلة
  var isPressed = false.obs;
  

  // دالة لتحميل العناصر المفضلة من SharedPreferences
  Future<void> loadFavoriteItems() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedItems = prefs.getStringList('nativaction');

    if (savedItems != null && savedItems.isNotEmpty) {
      nativation.value = savedItems
          .map((item) => Map.from({
                'name': item.split('|')[0],
                'image': item.split('|')[1],
                 'description': item.split('|')[2],
              }))
          .toList();
    }
  }

  // دالة لإضافة عنصر إلى المفضلة
  Future<void> addItemToFavorite(Map<String, String> item) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    nativation.add(item);
// |${item['image']}|${item['description']
    List<String> itemList = nativation
        .map(
            (item) => '${item['name'] }|${item['image']}|${item['description']}' 
            )
        .toList();
    await prefs.setStringList(
        'nativaction', itemList); // حفظ في SharedPreferences
  }

  // دالة لإزالة عنصر من المفضلة
  Future<void> removeItemFromFavorite(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    nativation.removeAt(index);

    List<String> itemList = nativation
        .map(
            (item) => '${item['name']}|${item['image']}|${item['description']}')
        .toList();
    await prefs.setStringList('nativaction', itemList); // تحديث SharedPreferences
  }

  @override
  void onInit() {
    super.onInit();
    loadFavoriteItems(); // تحميل العناصر عند بدء الصفحة
  }
}
