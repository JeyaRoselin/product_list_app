
import 'package:dio/dio.dart';
import 'package:product_list_app/controller/auth_repository/api_service.dart';
import 'package:product_list_app/controller/constants/api_constants.dart';
import '../../model/response_models/product_list_model.dart';



class AuthRepository {
  final Dio _dio = Dio();
final ApiService apiService;
 
  AuthRepository(this.apiService);
  

     Future<dynamic> userProductList()async{
 try {
 
      var response = await apiService.get(ApiConstant.userProductList,{});
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        
        return (true,ProductListModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
       
        return (false, ProductListModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, ProductListModel());
    }
    } 
     Future<dynamic> userProductSearch(String? text)async{
 try {
 
      var response = await apiService.get('${ApiConstant.userProductSearch}${text}',{});
       if (response.statusCode == 200 ) {
        var responseData = response.data;
        
        return (true,ProductListModel.fromJson(responseData));
       }
       else {
        // Handle other status codes
       
        return (false, ProductListModel());
      }
    } catch (e,stacktrace) {
      print('Exception occurred: $e');
      print('Stacktrace${stacktrace}');
      return (false, ProductListModel());
    }
    } 
    
}