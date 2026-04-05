import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:product_list_app/controller/auth_repository/enums.dart';
import 'package:product_list_app/controller/constants/constant.dart';
import 'package:product_list_app/controller/constants/sharedpreference_help.dart';
import 'package:product_list_app/controller/cubits/product_list_cubit.dart';
import 'package:product_list_app/controller/router/app_router.gr.dart';
import 'package:product_list_app/controller/states/product_list_state.dart';
import 'package:product_list_app/model/response_models/product_list_model.dart';
import 'package:product_list_app/view/common_widgets/indicator_widget.dart';
import 'package:product_list_app/view/common_widgets/product_card_widget.dart';
import 'package:product_list_app/view/common_widgets/text_form_widget.dart';
import 'package:product_list_app/view/common_widgets/text_view_small.dart';
import 'package:product_list_app/view/common_widgets/title_app_bar_widget.dart';

@RoutePage()
class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
   late SharedPreferenceHelper sharedPreferenceHelper;
  bool isPrefsReady = false;

  int? favoriteId;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    initPrefs();
    context.read<ProductListCubit>().login();
  }

  Future<void> initPrefs() async {
    sharedPreferenceHelper = SharedPreferenceHelper();
    await sharedPreferenceHelper.init();

    setState(() {
      isPrefsReady = true;
    });
  }

  void storeProducts(Products? product) {
    // if (!isPrefsReady) return;

    sharedPreferenceHelper.saveUserProduct([
      product ?? Products(),
    ]);
  }
  Widget build(BuildContext context) {
  
    return  Scaffold(
      backgroundColor: appBackColor,
      appBar: TitleAppBarWidget(title:"Products"),
      body: SingleChildScrollView(
 child:   BlocConsumer<ProductListCubit, ProductListState>(
            listener: (context, state) {
           
      if (state.networkStatusEnum == NetworkStatusEnum.loaded ) {
   
      }
      
    },
     builder: (context, state) {
     if(  state.networkStatusEnum==NetworkStatusEnum.loading){
      return CircularWidgetC();
    }
    if( state.networkStatusEnum==NetworkStatusEnum.loaded){
      
     return
       Padding(padding: EdgeInsets.all(screenPadding),
       child:Form(
        key:_formKey,
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width/1.8,
                  child: TextForm(keyboardType: TextInputType.none,
                  isDense: true,
                  onTap: (){
                  context.router.push(ProductSearchScreen()) ; 
                  },
                  readOnly: true,
                  hintText: "Search Products",prefixWidget: Icon(Icons.search),),
                ),
                InkWell(
                  onTap: () {
                    context.router.push(FavouriteListScreen());
                  },
                  child: Row(
                    children: [
                      Icon(Icons.favorite,color: redColor,),
                      TextViewSmall(title: "Favourite",textcolor: blueColor,)
                    ],
                  ),
                )
              ],
            ),
         vericalSpaceMedium,
               ListView.builder(
          itemCount: state.model.products?.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context,index){
          var data=state.model.products?[index];
              
          return 
               ProductSmallCardWidget(data: data,
             favouriteId: favoriteId,
               onClickFavourite: (p0) {
          setState(() {
            favoriteId=data?.id;
          });
          storeProducts(data);
               },);})]),
       ));
}
else
return CircularWidgetC();
})));} 

}
      