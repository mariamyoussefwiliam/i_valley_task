import 'package:flutter/material.dart';
import 'package:i_valley_task/shared/resources/color_manager.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerHelper {
  buildBasicShimmer(
      {double height = double.infinity, double width = double.infinity}) {
    return Shimmer.fromColors(
      baseColor: ColorManager.shimmerBase,
      highlightColor: ColorManager.shimmerHighlighted,
      child: Container(
        height: height,
        width: width,
        color: Colors.white,
      ),
    );
  }

}
