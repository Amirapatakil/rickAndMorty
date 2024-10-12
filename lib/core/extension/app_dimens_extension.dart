
import 'package:flutter/material.dart';

extension DoubleExtension on double {
  Widget get vertical => SizedBox(
        height: this,
      );
  Widget get horizontal => SizedBox(
        width: this,
      );

  EdgeInsets get all => EdgeInsets.all(this);

  EdgeInsets get symmetricHorizontal => EdgeInsets.symmetric(horizontal: this);

  EdgeInsets get symmetricVertical => EdgeInsets.symmetric(vertical: this);
}

extension ContextExtension on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
}
