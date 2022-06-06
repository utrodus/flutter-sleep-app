import 'package:flutter/material.dart';
import '../../themes.dart';
import '../../utils/responsive.dart';

class PrimaryBtn extends StatelessWidget {
  const PrimaryBtn({
    Key? key,
    required this.label,
    this.onPressed,
  }) : super(key: key);
  final String label;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: Responsive.isDesktop(context) ||
                  Responsive.isLargeDesktop(context)
              ? 45
              : 60),
      color: Colors.transparent,
      width: screenWidth * 0.7,
      child: ElevatedButton(
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.symmetric(
            vertical: Responsive.isDesktop(context) ||
                    Responsive.isTabletPotrait(context)
                ? 24
                : 19,
          )),
          backgroundColor: MaterialStateProperty.all(kSecondaryColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          )),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: Theme.of(context).textTheme.headline6!.copyWith(fontSize: 15),
        ),
      ),
    );
  }
}
