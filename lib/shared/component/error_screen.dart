import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget noInternet(
  context, {
  required Function onPressed,
}) =>
    Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/json/oops.json',
              width: MediaQuery.of(context).size.width / 1, height: 400),
          const Text(
            'Check Internet Connection',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22),
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
            onPressed: () {
              onPressed();
            },
            child: const Text('Retry'),
          ),
        ],
      ),
    );
