import 'package:flutter/material.dart';
import 'package:im_stepper/stepper.dart';

import '../../utils/constants.dart';

class CustomDotStepper extends StatelessWidget {
  final int activeDot;
  const CustomDotStepper({
    Key key,
    this.activeDot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DotStepper(
      tappingEnabled: false,
      dotCount: 3,
      dotRadius: 6,
      activeStep: activeDot,
      shape: Shape.circle,
      spacing: 30,
      indicator: Indicator.shift,
      fixedDotDecoration: FixedDotDecoration(color: kGrey),
      indicatorDecoration: IndicatorDecoration(
        strokeWidth: 0,
        strokeColor: kPrimaryColor,
        color: kPrimaryColor,
      ),
    );
  }
}
