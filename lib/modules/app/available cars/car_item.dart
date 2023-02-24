import 'package:flutter/material.dart';
import 'package:i_valley_task/shared/resources/font_manager.dart';

import '../../../models/car/available_cars_model.dart';
import '../../../shared/component/component.dart';
import '../../../shared/resources/color_manager.dart';
import '../../../shared/resources/values_manager.dart';

class CarItem extends StatelessWidget {
  const CarItem({
    required this.carModel,
    Key? key,
  }) : super(key: key);

  final AvailableCarModel carModel;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(
            left: AppPadding.p16,
            bottom: AppPadding.p16,
            right: AppPadding.p12),
        child: Material(
          elevation: AppSize.s4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(AppPadding.p8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.only(left: AppPadding.p16),
                    child: Container(
                      height: MediaQuery.of(context).size.width / 2.5,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSize.s12),
                      ),
                      child: ClipRRect(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          borderRadius: BorderRadius.circular(8.0),
                          child: imageFromNetwork(
                              fit: BoxFit.cover,
                              url: carModel.mainImagePath ?? "")),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${carModel.brandName ?? ""} - ${carModel.model ?? ""}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                      ),
                      customHSpace(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                           Text(
                            "${carModel.price??""} ريال",
                            style:const TextStyle(
                                fontSize: AppSize.s14,
                                color: ColorManager.darkOrange),
                          ),
                          customRSpace(size: 0.5),
                          const Text(
                            "(بعد الضريبة)",
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: AppSize.s12,
                                color: ColorManager.grey1),
                          ),
                        ],
                      ),
                      customHSpace(),
                       Text(
                       " ${carModel.mainTitle??""}",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            color: ColorManager.green,
                            fontSize: AppSize.s16,
                            fontWeight: FontWeightManager.bold),
                      ),
                      customHSpace(),
                      Text(
                        carModel.description??"",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                      ),
                      Row(
                        children: const [
                          Spacer(),
                          Icon(
                            Icons.location_on_outlined,
                            color: ColorManager.lightRed,
                            size: 20,
                          ),
                          Text(
                            "الرياض",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: ColorManager.perple,
                              fontSize: AppSize.s14,
                            ),
                          ),
                          Text(
                            " | ",
                          ),
                          Text(
                            "منذ 5 ساعات",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: ColorManager.perple,
                              fontSize: AppSize.s14,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
