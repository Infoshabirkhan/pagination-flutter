import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pagination_flutter/model/passenger_api.dart';
import 'package:pagination_flutter/repositary/api_repo.dart';

part 'api_state.dart';

class ApiCubit extends Cubit<ApiState> {
  ApiCubit() : super(ApiInitial());


  getData({bool fromInit = true}) async {
    // emit(ApiLoading());


    var data = await ApiRepo.getData(fromInit: fromInit);
    if(data != null){

      emit(ApiLoaded(model: data, isToLoadMore: fromInit == false ? true: false));
    }
    else{
      emit(ApiError());
    }
  }
}
