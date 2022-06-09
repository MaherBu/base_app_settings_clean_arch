import 'package:flutter/material.dart';
import 'package:service_provider/app/theme/color_dark_scheme.dart';
import 'package:service_provider/app/theme/typo.dart';

ThemeData _buildServiceProviderDarkTheme(ThemeData base) {
  return base.copyWith(
    useMaterial3: true,
    colorScheme: darkColorScheme,
    typography: Typography.material2018(),
    textTheme: buildTextTheme(base.textTheme, darkColorScheme.onBackground),
    scaffoldBackgroundColor: darkColorScheme.surfaceVariant,
    dividerTheme: DividerThemeData(
      color: darkColorScheme.surfaceVariant,
      thickness: 1.0,
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      //backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
    ),
  );
}

ThemeData darkTheme() => _buildServiceProviderDarkTheme(ThemeData.dark());
