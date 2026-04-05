import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:product_list_app/controller/constants/constant.dart';
import 'package:product_list_app/controller/constants/sharedpreference_help.dart';
import 'package:product_list_app/model/response_models/product_list_model.dart';
import 'package:product_list_app/view/common_widgets/product_card_widget.dart';
import 'package:product_list_app/view/common_widgets/text_view_large.dart';
import 'package:product_list_app/view/common_widgets/title_app_bar_widget.dart';

@RoutePage()
class FavouriteListScreen extends StatefulWidget {
  const FavouriteListScreen({super.key});

  @override
  State<FavouriteListScreen> createState() => _FavouriteListScreenState();
}

class _FavouriteListScreenState extends State<FavouriteListScreen> {
  @override
   late SharedPreferenceHelper sharedPreferenceHelper;
  bool isPrefsReady = false;

int? favoriteId;
List<Products?>? produts;
  @override
  void initState() {
    super.initState();
    initPrefs();
     sharedPreferenceHelper.init;
    getPrducts();
  }
Future<void> initPrefs() async {
    sharedPreferenceHelper = SharedPreferenceHelper();
    await sharedPreferenceHelper.init();

    setState(() {
      isPrefsReady = true;
    });
  }
  void getPrducts(){
    // if (!isPrefsReady) return;

    setState(() {
      produts= sharedPreferenceHelper.getproducts();
    });
  }
  Widget build(BuildContext context) {
  
    return  Scaffold(
      backgroundColor: appBackColor,
      appBar: TitleAppBarWidget(title:"Favourites"),
      body: SingleChildScrollView(
 child:  
       Padding(padding: EdgeInsets.all(screenPadding),
       child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
       
   ( produts?.length??0)>0?  ListView.builder(
        itemCount:produts?.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context,index){
        var data=produts?[index];
            
        return 
      ProductCardWidget(data: data,
    favouriteId: data?.id,
      onClickFavourite: (p0) {
        // setState(() {
        //   favoriteId=data?.id;
        // });
      
      },);}):TextViewLarge(title: 'No Data',textcolor: blackColor,)]))));
}


}
      