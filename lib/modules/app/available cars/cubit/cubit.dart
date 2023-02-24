import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_valley_task/modules/app/available%20cars/cubit/state.dart';
import 'package:i_valley_task/shared/network/remote/end_points.dart';

import '../../../../models/car/available_cars_model.dart';
import '../../../../models/general/general_model.dart';
import '../../../../shared/network/remote/dio-helper.dart';

class AvailableCarsCubit extends Cubit<AvailableCarsState> {
  AvailableCarsCubit() : super(InitAvailableCarsState());

  static AvailableCarsCubit get(context) => BlocProvider.of(context);
  APIResult result = APIResult();
  final _listOfCars = <AvailableCarModel>[];

  final StreamController<List<AvailableCarModel>> _listOfCarsController =
      StreamController<List<AvailableCarModel>>();

  int pageNumber = 1;

  Stream<List<AvailableCarModel>> get suggestionStream =>
      _listOfCarsController.stream;

  Future<void>? getAvailableCarsData() {
    emit(GetAvailableCarsLoadingState());
    DioHelper.postData(
        url: getAllAvailableCar,
        data: {"pageNumber": pageNumber, "rowsOfPage": 10},
        query: {}).then((value) {
      result = value;
       print("page number is $pageNumber");
      print(value.toString());
      if (result.hasError == false) {
        for (var element in result.data!) {
          _listOfCars.add(AvailableCarModel.fromJson(element));
          _listOfCarsController.sink.add(_listOfCars);
        }

        emit(GetAvailableCarsSuccessState());
      } else {
        print(result.failure?.error?.toString());
        emit(GetAvailableCarsErrorState(result.failure!.error!));
      }
    });
    return null;
  }

  void dispose() {
    pageNumber=1;
    _listOfCarsController.close();
    _listOfCars.clear();
  }
}
