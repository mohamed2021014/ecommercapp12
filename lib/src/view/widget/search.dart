
import 'package:ecomerca/src/view/screen/prudictdetils.dart';
import 'package:ecomerca/src/view/widget/prudictcart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataSearch extends SearchDelegate {
  // قائمة من نوع Map تحتوي على بيانات الأسماء والأوصاف
 final List dataa ;
DataSearch( {required this.dataa })  ;
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      // زر المسح (Clear)
      IconButton(
        icon:const Icon(Icons.clear),
        onPressed: () {
          query = '';  // مسح النص
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon:const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');  // إغلاق البحث
      },
    );
  }

  @override
   buildResults(BuildContext context) {
    // تصفية النتائج بناءً على النص المدخل
    final results = dataa.where((item) {
      return item['name']!.toLowerCase().contains(query.toLowerCase()) ;
    }).toList();

    return 
    ListView(
      children: results.map((item) {
        return const Text('kk') ;
      }).toList(),
    );
  }
//==========================================================================================




  @override
  Widget buildSuggestions(BuildContext context) {
    // اقتراحات أثناء الكتابة
    final suggestions = query.isEmpty
        ? dataa
        : dataa.where((item) {
            return item['name']!.toLowerCase().contains(query.toLowerCase()) 
                  ;
          }).toList();

    return ListView(
      children: suggestions.map((item) {
        return Padding(
                padding: const EdgeInsets.all(8.0),
                child: 
                   GridView.builder(
                    shrinkWrap: true,
                    physics:const NeverScrollableScrollPhysics(),
                    gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // عدد الأعمدة
                      crossAxisSpacing: 8.0, // المسافة بين الأعمدة
                      mainAxisSpacing: 8.0, // المسافة بين الصفوف
                      childAspectRatio: 0.7, // نسبة عرض العنصر إلى ارتفاعه
   mainAxisExtent: 300
                     ),
                    itemCount: suggestions.length, 
                    itemBuilder: (context, index) {
                      return ProductCard( 
                        onTap: () { 
                             index =index ;
                       Get.to((Prudictdetils(dataa:suggestions[index]  ,)));
                        },
                        name: suggestions[index]['name']!,
                        price: suggestions[index]['price']!,
                       image:suggestions[index]['image']!,
                      );
                    },
                  ), 
                 
                
              );
      }).toList(),
    );
  }
}

