import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_valley_task/layout/cubit/cubit.dart';
import 'package:i_valley_task/layout/homeLayout.dart';
import 'package:i_valley_task/shared/resources/theme_manager.dart';
import '../modules/app/available cars/cubit/cubit.dart';
import '../shared/component/no_network_layout.dart';
import '../shared/resources/langauge_manager.dart';

class MyApp extends StatelessWidget {
  final Widget? widget = const HomeLayout();

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LayoutCubit(),
        ),
        BlocProvider(
          create: (context) => AvailableCarsCubit()..getAvailableCarsData(),
        ),
      ],
      child: MaterialApp(
        builder: (BuildContext? context, Widget? child) {
          return MediaQuery(
            data: MediaQuery.of(context!).copyWith(
              textScaleFactor: 1.0,
            ),
            //set desired text scale factor here
            child: child!,
          );
        },
        debugShowCheckedModeBanner: false,
        home: Directionality(
            textDirection: TextDirection.rtl,
            child: CheckNetworkLayout(widget: widget!)),
        locale: ARABIC_LOCAL,
        theme: getApplicationTheme(),
      ),
    );
  }
}
