import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list_app/controller/states/product_list_state.dart';

import '../auth_repository/auth_repository.dart';
import '../auth_repository/enums.dart';

class ProductListCubit extends Cubit<ProductListState> {
  AuthRepository authRepository;

 ProductListCubit({required this.authRepository})
      : super(ProductListState.initial());

  Future<void >login() async {
    emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loading));

    (bool,dynamic) response = await authRepository.userProductList();

    if (response.$1 == true) {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.loaded,model: response.$2,));
    } else {
      emit(state.copyWith(networkStatusEnum: NetworkStatusEnum.failed,model: response.$2));
    }
  }
  
}