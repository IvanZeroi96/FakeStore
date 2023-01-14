import 'package:fakestore/model/colors.dart';
import 'package:flutter/material.dart';

class CircularProgress extends StatelessWidget {
  final double width;
  final double height;
  final double stokeWidth;

  CircularProgress(
      {super.key,
      this.width = 40.0,
      this.height = 40.0,
      this.stokeWidth = 2.0});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        height: height,
        child: CircularProgressIndicator(
          valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
          backgroundColor: FSColors.purple,
          strokeWidth: stokeWidth,
        ));
    //return Image.asset('assets/images/loading.gif', width: width, height: height,);
  }
}
