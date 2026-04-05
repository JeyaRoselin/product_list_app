import 'package:equatable/equatable.dart';
import 'package:product_list_app/controller/auth_repository/enums.dart';
import 'package:product_list_app/model/response_models/product_list_model.dart';

class ProductSearchState extends Equatable {
  final NetworkStatusEnum networkStatusEnum;
  final ProductListModel model;



  const ProductSearchState({
    required this.networkStatusEnum,
    required this.model
  });

  factory ProductSearchState.initial() => ProductSearchState(
        networkStatusEnum: NetworkStatusEnum.initial,
       model: ProductListModel(),
      );

  @override
  List<Object?> get props => [networkStatusEnum,model];

 ProductSearchState copyWith(
      {NetworkStatusEnum? networkStatusEnum,
      NetworkStatusEnum? childNetworkStatusEnum,
      int? currentPage,
     ProductListModel? model}) {
    return ProductSearchState(
     model: model??this.model,
        networkStatusEnum: networkStatusEnum ?? this.networkStatusEnum);
        
  }
}