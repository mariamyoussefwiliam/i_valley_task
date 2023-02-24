import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_valley_task/shared/network/remote/dio-helper.dart';
import 'package:i_valley_task/shared/observer.dart';
import 'app/app.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();
  BlocOverrides.runZoned(
    () {
      runApp(const MyApp());
    },
    blocObserver: MyBlocObserver(),
  );
}
