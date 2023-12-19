import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:to_do_app/core/class/statuscode.dart';
import 'package:to_do_app/core/constant/image_asset.dart';

class HandlingDataView extends StatelessWidget {
  final double? height;
  final StatusRequest statusRequest;
  final Widget widget;
  final Future<void> Function() onRefresh;
  const HandlingDataView(
      {Key? key,
      required this.statusRequest,
      required this.widget,
      this.height,
      required this.onRefresh})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? RefreshIndicator(
            onRefresh: onRefresh,
            child: ListView(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: height! / 3),
                  child:
                      Lottie.asset(AppImageAsset.loading, height: height! / 3),
                )
              ],
            ),
          )
        // : statusRequest == StatusRequest.failure
        //     ? RefreshIndicator(
        //         child: Column(
        //           children: [Lottie.asset(AppImageAsset.noData)],
        //         ),
        //         onRefresh: () async {})
        : widget;
  }
}
