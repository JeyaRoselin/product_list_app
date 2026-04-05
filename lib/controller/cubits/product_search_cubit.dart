import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list_app/controller/auth_repository/auth_repository.dart';
import 'package:product_list_app/controller/auth_repository/enums.dart';

import '../states/product_search_state.dart';

class ProductSearchCubit extends Cubit<ProductSearchState> {
  AuthRepository authRepository;

 ProductSearchCubit({required this.authRepository})
      : super(ProductSearchState.initial());

  Future<void >login(String? text) async {
    emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loading));

    (bool,dynamic) response = await authRepository.userProductSearch(text);

    if (response.$1 == true) {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loaded,model: response.$2,));
    } else {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.failed,model: response.$2));
    }
  }
  
}