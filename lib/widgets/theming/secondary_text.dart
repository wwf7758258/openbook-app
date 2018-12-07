import 'package:Openbook/models/theme.dart';
import 'package:Openbook/provider.dart';
import 'package:flutter/material.dart';
import 'package:pigment/pigment.dart';

class OBSecondaryText extends StatelessWidget {
  String text;
  TextStyle style;

  OBSecondaryText(this.text, {this.style});

  @override
  Widget build(BuildContext context) {
    var themeService = OpenbookProvider.of(context).themeService;

    return StreamBuilder(
        stream: themeService.themeChange,
        initialData: themeService.getActiveTheme(),
        builder: (BuildContext context, AsyncSnapshot<OBTheme> snapshot) {
          var theme = snapshot.data;

          TextStyle finalStyle = style;
          TextStyle themedTextStyle =
          TextStyle(color: Pigment.fromString(theme.secondaryTextColor));

          if (finalStyle != null) {
            finalStyle = finalStyle.merge(themedTextStyle);
          } else {
            finalStyle = themedTextStyle;
          }

          return Text(text, style: finalStyle);
        });
  }
}
