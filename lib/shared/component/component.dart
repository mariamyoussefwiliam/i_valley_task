import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:i_valley_task/shared/network/remote/end_points.dart';
import 'package:i_valley_task/shared/resources/assets_manager.dart';
import 'package:i_valley_task/shared/resources/color_manager.dart';
import 'package:lottie/lottie.dart';

void navigatorAndRemove(context, Widget widget) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ),
    (Route<dynamic> route) => false,
  );
}

void navigator(context, Widget widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

Widget imageFromNetwork(
    {required String url,
    fit = BoxFit.contain,}) {
  return CachedNetworkImage(
    imageUrl: baseURL+url,
    placeholder: (context, url) => Center(
      child: Lottie.asset(
        JsonAssets.loading,
      ),
    ),
    errorWidget: (context, url, error) =>
        SvgPicture.asset(ImageAssets.carIcon),
    fit: fit,
  );
}

Widget divider() {
  return const Divider(
    color: ColorManager.dividerColor,
  );
}
Widget customHSpace({double size = 1}) {
  return SizedBox(
    height: 10* size,
  );
}

Widget customRSpace({double size = 1}) {
  return SizedBox(
    width: 15 * size,
  );
}
