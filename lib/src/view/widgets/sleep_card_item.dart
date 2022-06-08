import 'package:flutter/material.dart';

import '../../themes.dart';

class SleepCardItem extends StatelessWidget {
  const SleepCardItem({
    Key? key,
    required this.image,
    required this.label,
    required this.subtitle,
  }) : super(key: key);

  final String image;
  final String label;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, bottom: 5),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: FadeInImage.assetNetwork(
                  placeholder: "assets/image_placeholder.jpg",
                  width: double.infinity,
                  fit: BoxFit.cover,
                  image: image,
                  imageErrorBuilder: (c, o, s) => Image.asset(
                    "assets/image_placeholder.jpg",
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      label,
                      maxLines: 1,
                      style: TextStyle(
                        fontWeight: bold,
                        fontSize: 14,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: mediumTextStyle.copyWith(
                        fontWeight: medium,
                        fontSize: 11,
                      ),
                    ),
                  ]),
            ),
          ]),
    );
  }
}
