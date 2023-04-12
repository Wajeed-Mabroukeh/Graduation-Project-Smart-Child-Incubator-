import 'dart:ui';
import 'package:flutter/material.dart';

class ColorConstant {
  static Color gray600 = fromHex('#797c7a');

  static Color gray60001 = fromHex('#797c7b');

  static Color green50028 = fromHex('#283ac037');

  static Color red900 = fromHex('#a72020');

  static Color gray900 = fromHex('#222222');

  static Color green50072 = fromHex('#723ac037');

  static Color black9003f = fromHex('#3f000000');

  static Color gray300 = fromHex('#e6e6e6');

  static Color green500 = fromHex('#3ac037');

  static Color black90001 = fromHex('#000d07');

  static Color black90011 = fromHex('#11000000');

  static Color black900 = fromHex('#000000');

  static Color bluegray400 = fromHex('#888888');

  static Color gray50066 = fromHex('#66aaaaaa');

  static Color whiteA700 = fromHex('#ffffff');

  static Color green5007f = fromHex('#7f3ac037');

  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
