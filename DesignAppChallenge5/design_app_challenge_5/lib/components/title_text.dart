import 'package:design_app_challenge_5/size_config.dart';
import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  const TitleText({
    Key key, this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return new Text(
      title,
      style: new TextStyle(
        fontSize: defaultSize * 1.6, //16.0
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
