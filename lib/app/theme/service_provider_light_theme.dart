import 'package:flutter/material.dart';
import 'package:service_provider/app/theme/color_light_scheme.dart';
import 'package:service_provider/app/theme/typo.dart';

ThemeData _buildServiceProviderLightTheme(ThemeData base) {
  return base.copyWith(
    useMaterial3: true,
    colorScheme: lightColorScheme,
    textTheme: buildTextTheme(base.textTheme, lightColorScheme.onBackground),
    dividerTheme: DividerThemeData(
      color: lightColorScheme.surfaceVariant,
      thickness: 1.0,
    ),
    scaffoldBackgroundColor: lightColorScheme.surfaceVariant,
    bottomSheetTheme: const BottomSheetThemeData(
      //backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
    ),
    typography: Typography.material2018(),
    backgroundColor: lightColorScheme.background,
  );
}

ThemeData lightTheme() => _buildServiceProviderLightTheme(ThemeData.light());
