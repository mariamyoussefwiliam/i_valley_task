import 'package:flutter/material.dart';
import 'package:i_valley_task/modules/app/available%20cars/car_item.dart';
import 'package:i_valley_task/modules/app/available%20cars/cubit/cubit.dart';

import '../../../models/car/available_cars_model.dart';

class AvailableCarsScreen extends StatefulWidget {
  const AvailableCarsScreen({Key? key}) : super(key: key);

  @override
  State<AvailableCarsScreen> createState() => _AvailableCarsScreenState();
}

class _AvailableCarsScreenState extends State<AvailableCarsScreen> {
  ScrollController? _controller;
  final _Bloc = AvailableCarsCubit(); // In production, a provider should be used instead of initializing here

  @override
  void initState() {
    super.initState();
    _Bloc.getAvailableCarsData();
    _Bloc.pageNumber++;
    _controller = ScrollController()..addListener(_scrollListener);
  }
  void _scrollListener() {
    if (_controller?.position.pixels!=null&&_controller?.position.pixels == _controller?.position.maxScrollExtent) {
      _Bloc.getAvailableCarsData();
      _Bloc.pageNumber++;
    }
  }
  @override
  Widget build(BuildContext context) =>_buildSuggestions();


  Widget _buildSuggestions() {
    return StreamBuilder<List<AvailableCarModel>>(
        stream: _Bloc.suggestionStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                controller: _controller,
                itemCount: snapshot.data!.length + 1,
                itemBuilder: (context, index) {
                  return index >= snapshot.data!.length
                      ? MyLoader(25, 25) // the reason why snapshot.data.length + 1
                      : CarItem(carModel:snapshot.data![index]);
                });
          } else {
            return MyLoader(45, 45);
          }
        }
    );
  }

  @override
  void dispose() {
    _Bloc.dispose();
    super.dispose();
  }
}



class MyLoader extends StatelessWidget {
  final double width;
  final double height;

  MyLoader(this.width, this.height);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: SizedBox(
          width: width,
          height: height,
          child: CircularProgressIndicator(
            strokeWidth: 3.0,
          ),
        ),
      ),
    );
  }
}

