import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_valley_task/layout/cubit/cubit.dart';
import 'package:i_valley_task/layout/cubit/states.dart';
import 'package:i_valley_task/shared/resources/color_manager.dart';
import 'package:i_valley_task/shared/resources/values_manager.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = LayoutCubit.get(context);

          return Scaffold(
            appBar: AppBar(
              title: Text(cubit.titles[cubit.index]),
              elevation: AppSize.s4,
              actions: [
                //list if widget in appbar actions
                PopupMenuButton(
                  itemBuilder: (context) => [
                    const PopupMenuItem<int>(
                      value: 0,
                      child: Text("Setting"),
                    ),
                  ],
                  onSelected: (item) => {print(item)},
                ),
              ],
            ),
            body: Center(
              child: cubit.screens[cubit.index],
            ),
            bottomNavigationBar: BottomNavigationBar(
              iconSize: 30,
              selectedItemColor: ColorManager.primary,
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.index,
              onTap: (value) {
                cubit.changeIndex(value);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.car_crash_rounded),
                  label: "سيارات متاحة",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_today_sharp),
                  label: "صفقات يومية",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search),
                  label: "بحث عام",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.add_circle_outline_sharp),
                  label: "اضافة اعلان",
                ),
              ],
            ),
          );
        });
  }
}
