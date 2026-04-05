
import 'package:auto_route/auto_route.dart';
import 'package:product_list_app/controller/router/app_router.gr.dart';

import 'package:product_list_app/controller/router/router_path.dart';










@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
         AutoRoute(
            path: RouterPath.splash_path,
            page: SplashScreen.page,
            initial: true),
         
       
             AutoRoute(
            path: RouterPath.product_list_path,
            page:ProductListScreen.page,),
         
       AutoRoute(
            path: RouterPath.product_search_path,
            page: ProductSearchScreen.page,),
               AutoRoute(
            path: RouterPath.favourite_path,
            page: FavouriteListScreen.page,),
    

         
            ];
            }