import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../themes.dart';

Padding sleepItemLoading(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(right: 10, bottom: 5),
    child: Shimmer.fromColors(
      baseColor: kShimmerBaseColor,
      highlightColor: kShimmerHightlightColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(right: 10, bottom: 5),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  height: MediaQuery.of(context).size.height * 0.010,
                  width: MediaQuery.of(context).size.width * 0.25,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 7),
                  height: MediaQuery.of(context).size.height * 0.008,
                  width: MediaQuery.of(context).size.width * 0.1,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
