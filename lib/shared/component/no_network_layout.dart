import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import '../resources/color_manager.dart';

class CheckNetworkLayout extends StatelessWidget {
  final Widget widget;

  const CheckNetworkLayout({required this.widget, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
        connectivityBuilder: (context, connectivity, child) {
          bool checkNetwork = connectivity != ConnectivityResult.none;
          // if internet lost show container with the text no connection
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: 0,
              systemOverlayStyle: null,
            ),
            body: Stack(
              fit: StackFit.expand,
              children: [
                child,
                checkNetwork == false
                    ? Positioned(
                        bottom: 3,
                        left: 0.0,
                        right: 0.0,
                        height: 80.0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AnimatedContainer(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: checkNetwork != true
                                  ? ColorManager.noConnection
                                  : null,
                            ),
                            duration: const Duration(milliseconds: 200),
                            child: checkNetwork != true
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const <Widget>[
                                      Padding(
                                        padding: EdgeInsets.all(12.0),
                                        child: Icon(
                                          Icons.wifi_off_rounded,
                                          color: Colors.white70,
                                        ),
                                      ),
                                      Text(
                                        "You are currently offline .",
                                        style: TextStyle(
                                            color: Colors.white70,
                                            fontSize: 14),
                                      ),
                                      SizedBox(
                                        width: 8.0,
                                      ),
                                    ],
                                  )
                                : null,
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
          );
        },
        child: Scaffold(body: widget));
  }
}
