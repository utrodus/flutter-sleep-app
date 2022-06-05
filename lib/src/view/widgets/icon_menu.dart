import 'package:flutter/material.dart';

import '../../themes.dart';

class IconMenu extends StatelessWidget {
  const IconMenu({
    Key? key,
    required this.label,
    required this.isSelected,
    required this.icon,
  }) : super(key: key);

  final String label;
  final bool isSelected;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
          splashColor: Colors.transparent,
          onTap: () {},
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
