import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list_app/controller/auth_repository/enums.dart';
import 'package:product_list_app/controller/constants/constant.dart';
import 'package:product_list_app/controller/cubits/product_search_cubit.dart';
import 'package:product_list_app/controller/states/product_search_state.dart';
import 'package:product_list_app/view/common_widgets/indicator_widget.dart';
import 'package:product_list_app/view/common_widgets/product_card_widget.dart';
import 'package:product_list_app/view/common_widgets/text_form_widget.dart';
import 'package:product_list_app/view/common_widgets/text_view_large.dart';
import 'package:product_list_app/view/common_widgets/title_app_bar_widget.dart';

import '../../controller/constants/sharedpreference_help.dart';

@RoutePage()
class ProductSearchScreen extends StatefulWidget {
  const ProductSearchScreen({super.key});

  @override
  State<ProductSearchScreen> createState() => _ProductSearchScreenState();
}

class _ProductSearchScreenState extends State<ProductSearchScreen> {
  @override
  late SharedPreferenceHelper sharedPreferenceHelper;

  @override
 
    final TextEditingController searchController=TextEditingController();
   
  Widget build(BuildContext context) {
  
    return  Scaffold(
      backgroundColor: appBackColor,
      appBar: TitleAppBarWidget(title:"Search Products"),
      body: SingleChildScrollView(
 child:   Column(
   children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextForm(keyboardType: TextInputType.text,
           controller: searchController,
           onChanged:(p0) {
             context.read<ProductSearchCubit>().login(searchController.text);
           },
            hintText: "Search Products",prefixWidget: Icon(Icons.search),),
      ),
     BlocConsumer<ProductSearchCubit, ProductSearchState>(
                listener: (context, state) {
               
          if (state.networkStatusEnum == NetworkStatusEnum.loaded ) {
       
          }
          
        },
         builder: (context, state) {
         if(  state.networkStatusEnum==NetworkStatusEnum.loading){
          return CircularWidgetC();
        }
      else
          
         return
           Padding(padding: EdgeInsets.all(screenPadding),
           child:Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            
     vericalSpaceMedium,
     (state.model.products?.length??0)>0?     ListView.builder(
            itemCount: state.model.products?.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context,index){
            var data=state.model.products?[index];
                
            return 
          ProductSmallCardWidget(data: data,);}):TextViewLarge(title: "No Products")]));
     }
     ),
   ],
 )));} 

}
      