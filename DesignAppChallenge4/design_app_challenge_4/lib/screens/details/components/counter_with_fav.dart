import 'package:design_app_challenge_4/screens/details/components/cart_counter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CounterWithFavButton extends StatelessWidget {
  const CounterWithFavButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        new CartCounter(),
        new Container(
          padding: EdgeInsets.all(8.0),
          height: 32.0,
          width: 32.0,
          decoration: new BoxDecoration(
            color: new Color(0xFFFF6464),
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset("assets/icons/heart.svg"),
        ),
      ],
    );
  }
}

