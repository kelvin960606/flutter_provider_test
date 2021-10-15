import 'package:flutter/material.dart';
import 'package:flutter_with_provider/constants/image.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(Images.top1, width: size.width),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(Images.top2, width: size.width),
          ),
          Positioned(
            top: 50,
            right: 30,
            child: Image.asset(Images.main, width: size.width * 0.35),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(Images.bottom1, width: size.width),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset(Images.bottom2, width: size.width),
          ),
          child
        ],
      ),
    );
  }
}
