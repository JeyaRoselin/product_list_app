import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:product_list_app/controller/constants/constant.dart';
import 'package:product_list_app/model/response_models/product_list_model.dart';
import 'package:product_list_app/view/common_widgets/row_bold_text_widget.dart';
import 'package:product_list_app/view/common_widgets/text_view_large.dart';
import 'package:product_list_app/view/common_widgets/text_view_medium.dart';
import 'package:product_list_app/view/common_widgets/text_view_small.dart';

class ProductCardWidget extends StatelessWidget {
  final Products? data;
final Function(int?)? onClickFavourite;
int? favouriteId;
 ProductCardWidget({super.key, this.data,this.onClickFavourite,this.favouriteId});

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: 170,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Image
           Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

          InkWell(
            onTap: () {
              onClickFavourite!(data?.id);
            },
            child: favouriteId==data?.id?Icon(Icons.favorite,color: redColor,):    Icon(Icons.favorite_outline)
             )  ],
           ),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                data?.thumbnail ?? '',
                height: 100.sp,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                    Container(color: Colors.grey.shade200, height: 120.sp),
              ),
            ),

     vericalSpaceMedium,

            /// Title
            TextViewMedium(
              name: data?.title ?? '',
              fontWeight: FontWeight.w600,
              textColors: Colors.black87,
            
              textAlign: TextAlign.start,
            ),

           vericalSpaceMedium,

            /// Price
            TextViewLarge(
              title: "₹${data?.price?.toStringAsFixed(0) ?? '0'}",
              fontWeight: FontWeight.bold,
              textcolor: Colors.green,
            
            ),

       vericalSpaceSmall,

            /// Rating
            Row(
              children: [
                Icon(Icons.star, color: Colors.orange, size: 16),
                const SizedBox(width: 4),
                TextViewSmall(
                  title: "${data?.rating ?? 0}",
                  textcolor: Colors.grey[700],
                 
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProductSmallCardWidget extends StatelessWidget {
  final Products? data;
final Function(int?)? onClickFavourite;
int? favouriteId;
 ProductSmallCardWidget({super.key, this.data,this.onClickFavourite,this.favouriteId});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(16),
        child: Container(
          width: 170,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Image
             Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
      
            InkWell(
              onTap: () {
                onClickFavourite!(data?.id);
              },
              child: favouriteId==data?.id?Icon(Icons.favorite,color: redColor,):    Icon(Icons.favorite_outline)
               )  ],
             ),
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      data?.thumbnail ?? '',
                      height:50.sp,
                      width: 50.sp,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          Container(color: Colors.grey.shade200, height: 120),
                    ),
                  ),
                  
                       vericalSpaceMedium,
                  
                  /// Title
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextViewMedium(
                        name: data?.title ?? '',
                        fontWeight: FontWeight.w600,
                        textColors: Colors.black87,
                       
                        textAlign: TextAlign.start,
                      ),
                      
                                 vericalSpaceSmall,
                      
                      /// Price
                      Row(
                        children: [
                          TextViewLarge(
                            title: "₹${data?.price?.toStringAsFixed(0) ?? '0'}",
                            fontWeight: FontWeight.bold,
                            textcolor: Colors.green,
                          
                          ),
                          horizontalSpaceSmall,
                            Row(
                        children: [
                          Icon(Icons.star, color: Colors.orange, size: 16),
                          const SizedBox(width: 4),
                          TextViewSmall(
                            title: "${data?.rating ?? 0}",
                            textcolor: Colors.grey[700],
                           // fontSizes: 12,
                          ),
                        ],
                      ),
                        ],
                      ),
                      
                             vericalSpaceSmall,
                   RowBoldTextWidget(title: "Weight", value: data?.weight.toString()),
                   RowBoldTextWidget(title: "SKU", value: data?.sku)
                      /// Rating
                    
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}