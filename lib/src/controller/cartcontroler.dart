import 'dart:convert';

import 'package:ecomerca/src/model/cartshredpref.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartController extends GetxController {
  var cartItems = <CartItem>[].obs;
 int _slectedind = 0; 



  @override
  void onInit() {
    super.onInit();
    _loadCartData();  // تحميل البيانات من SharedPreferences عند التهيئة
  
   }
 //bootmnavigationbarhome
  get slectedind => _slectedind;
  void changeindexnavigator(int selectindx) {
    _slectedind = selectindx;

    update();
  }
  // دالة لتحميل العناصر المخزنة في SharedPreferences
  Future<void> _loadCartData() async {
    final prefs = await SharedPreferences.getInstance();
    List<String>? cartData = prefs.getStringList('cartItems');
    if (cartData != null && cartData.isNotEmpty) {
      cartItems.value = cartData.map((e) {
        return CartItem.fromMap(Map<String, dynamic>.from(jsonDecode(e)));
      }).toList();
    }
  }

  // إضافة عنصر إلى العربة
  void addToCart(CartItem item) async {
    final prefs = await SharedPreferences.getInstance();

    // أضف العنصر أو قم بتحديث الكمية إذا كان موجودًا
    var existingItem = cartItems.firstWhereOrNull((element) => element.name == item.name);
    if (existingItem != null) {
      existingItem.quantity++;
    } else {
      cartItems.add(item);
    }

    // حفظ العناصر في SharedPreferences بعد التحديث
    List<String> cartData = cartItems.map((e) => jsonEncode(e.toMap())).toList();
    prefs.setStringList('cartItems', cartData);
  }

  // حساب الإجمالي
  double get totalPrice {
    return cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));
  } 
   // حذف عنصر من العربة
  void removeFromCart(CartItem item) async {
    final prefs = await SharedPreferences.getInstance();

    // إزالة العنصر من القائمة
    cartItems.removeWhere((element) => element.name == item.name);

    // تحديث SharedPreferences بعد الحذف
    List<String> cartData = cartItems.map((e) => jsonEncode(e.toMap())).toList();
    prefs.setStringList('cartItems', cartData);
  }

}