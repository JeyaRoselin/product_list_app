
import 'dart:convert';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:product_list_app/model/response_models/product_list_model.dart';

class SharedPreferenceHelper {
static late  SharedPreferences? _sharedPreferences;

  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  


    Future<void> saveUserProduct(List<Products> products) async {
    List<String> productsList =
        products.map((e) => jsonEncode(e.toJson())).toList();

    await _sharedPreferences?.setStringList(
        PrefKeys.products, productsList);
  }

   List<Products> getproducts() {
    List<String>? productsList =
        _sharedPreferences?.getStringList(PrefKeys.products);

    if (productsList != null && productsList.isNotEmpty) {
      return productsList
          .map((e) =>
              Products.fromJson(jsonDecode(e)))
          .toList();
    }
    return [];
  }
  

 
}

mixin PrefKeys {
  static const String products = "products"; 
  
  
}