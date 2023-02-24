import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_valley_task/layout/cubit/states.dart';
import 'package:i_valley_task/modules/app/add%20ad/add_ad_screen.dart';
import 'package:i_valley_task/modules/app/available%20cars/available_cars_screen.dart';
import 'package:i_valley_task/modules/app/public%20search/public_search_screen.dart';
import 'package:i_valley_task/modules/app/today%20deals/today_deals_screen.dart';

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutInitialState());

  static LayoutCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = const [
    AvailableCarsScreen(),
    TodayDealsScreen(),
    PublicSearchScreen(),
    AddAdScreen(),
  ];
  List<String> titles = const [
    "سيارات متاحة",
    "صفقات يومية",
    "بحث عام",
    "اضافة اعلان",
  ];

  int index = 0;

  void changeIndex(int currentIndex) {
    index = currentIndex;
    emit(ChangeIndexState());
  }
}
