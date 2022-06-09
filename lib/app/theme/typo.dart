import 'package:flutter/material.dart';

// for more info of each role
// https://m3.material.io/styles/typography/applying-scaling-type
TextTheme buildTextTheme(TextTheme base, Color displayColor) {
  return base
      .copyWith(
        //* DISPLAY ROLE *//
        displayLarge: base.displayLarge?.copyWith(
          fontWeight: FontWeight.normal,
          fontSize: 57.0,
          // height: 64.0,
          letterSpacing: -0.25,
        ),
        displayMedium: base.displayMedium?.copyWith(
          fontWeight: FontWeight.normal,
          fontSize: 45.0,
          // height: 52.0,
          letterSpacing: 0,
        ),
        displaySmall: base.displaySmall?.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 36.0,
          // height: 44.0,
          letterSpacing: 0,
        ),

        //* Headline ROLE *//
        headlineLarge: base.headlineLarge?.copyWith(
          fontWeight: FontWeight.normal,
          fontSize: 32.0,
          // height: 40.0,
          letterSpacing: 0,
        ),
        headlineMedium: base.headlineMedium?.copyWith(
          fontWeight: FontWeight.normal,
          fontSize: 28.0,
          // height: 36.0,
          letterSpacing: 0,
        ),
        headlineSmall: base.headlineSmall?.copyWith(
          fontWeight: FontWeight.normal,
          fontSize: 24.0,
          // height: 32.0,
          letterSpacing: 0,
        ),

        //* Title ROLE *//
        titleLarge: base.titleLarge?.copyWith(
          fontWeight: FontWeight.normal,
          fontSize: 22.0,
          // height: 28.0,
          letterSpacing: 0,
        ),
        titleMedium: base.titleMedium?.copyWith(
          fontWeight: FontWeight.normal,
          fontSize: 16.0,
          // height: 24.0,
          letterSpacing: 0.1,
        ),
        titleSmall: base.titleSmall?.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: 14.0,
          // height: 20.0,
          letterSpacing: 0.1,
        ),

        //* Label ROLE *//
        labelLarge: base.labelLarge?.copyWith(
          fontWeight: FontWeight.w600,
          fontSize: 14.0,
          // height: 20.0,
          letterSpacing: 0.1,
        ),
        labelMedium: base.labelMedium?.copyWith(
          fontSize: 12.0,
          fontWeight: FontWeight.normal,
          //height: 16.0,
          letterSpacing: 0.5,
        ),
        labelSmall: base.labelSmall?.copyWith(
          fontWeight: FontWeight.normal,
          fontSize: 11.0,
          // height: 16.0,
          letterSpacing: 0.5,
        ),

        //* Body ROLE *//
        bodyLarge: base.bodyLarge?.copyWith(
          fontWeight: FontWeight.normal,
          fontSize: 16.0,
          // height: 24.0,
          letterSpacing: 0.5,
        ),
        bodyMedium: base.bodyMedium?.copyWith(
          fontWeight: FontWeight.normal,
          fontSize: 14.0,
          // height: 20.0,
          letterSpacing: 0.5,
        ),
        bodySmall: base.bodySmall?.copyWith(
          fontWeight: FontWeight.normal,
          fontSize: 12.0,
          // height: 16.0,
          letterSpacing: 0.4,
        ),
      )
      .apply(
        fontFamily: 'SegoeUi',
        displayColor: displayColor,
        bodyColor: displayColor,
      );
}
