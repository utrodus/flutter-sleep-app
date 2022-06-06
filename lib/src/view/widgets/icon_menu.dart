import 'package:flutter/material.dart';

import '../../themes.dart';

class IconMenu extends StatelessWidget {
  const IconMenu({
    Key? key,
    required this.label,
    required this.isSelected,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  final String label;
  final bool isSelected;
  final String icon;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: screenWidth < 992
          ? const EdgeInsets.symmetric(horizontal: 10)
          : const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: InkWell(
          splashColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          onTap: onTap,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(15, 15.5, 15, 15.5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: isSelected ? kSecondaryColor : kLightPurpleColor,
                ),
                child: Image(
                  width: 35,
                  image: AssetImage(icon),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                label,
                style: TextStyle(
                  color:
                      isSelected ? kprimaryTextColor : kMediumPurpleTextColor,
                  fontWeight: medium,
                  fontSize: 14,
                ),
              )
            ],
          )),
    );
  }
}
