part of 'utils.dart';

class TextStyleHelper {
  static TextStyle _baseTextStyle({
    required double fontSize,
    FontWeight? fontWeight,
    Color? color,
    TextDecoration? decoration,
  }) {
    return GoogleFonts.poppins(
      fontSize: fontSize,
      fontWeight: fontWeight ?? FontWeight.normal,
      color: color ?? ColorHelper.black,
      decoration: decoration ?? TextDecoration.none,
    );
  }

  static TextStyle header1({
    Color? color,
    TextDecoration? decoration,
  }) {
    return _baseTextStyle(
      fontSize: 32.sp,
      fontWeight: FontWeight.w600,
      color: color,
      decoration: decoration,
    );
  }

  static TextStyle header2({
    Color? color,
    TextDecoration? decoration,
  }) {
    return _baseTextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.w600,
      color: color,
      decoration: decoration,
    );
  }

  static TextStyle subHeader1({
    Color? color,
    TextDecoration? decoration,
  }) {
    return _baseTextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      color: color,
      decoration: decoration,
    );
  }

  static TextStyle subHeader2({
    Color? color,
    TextDecoration? decoration,
  }) {
    return _baseTextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: color,
      decoration: decoration,
    );
  }

  static TextStyle body1({
    Color? color,
    TextDecoration? decoration,
  }) {
    return _baseTextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
      color: color,
      decoration: decoration,
    );
  }

  static TextStyle body2({
    Color? color,
    TextDecoration? decoration,
  }) {
    return _baseTextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      color: color,
      decoration: decoration,
    );
  }

  static TextStyle caption({
    Color? color,
    TextDecoration? decoration,
  }) {
    return _baseTextStyle(
      fontSize: 12.sp,
      color: color,
      decoration: decoration,
    );
  }

  static TextStyle overline({
    Color? color,
    TextDecoration? decoration,
  }) {
    return _baseTextStyle(
      fontSize: 10.sp,
      color: color,
      decoration: decoration,
    );
  }

  static TextStyle buttonText() {
    return _baseTextStyle(
      fontSize: 15.sp,
      fontWeight: FontWeight.w600,
    );
  }
}
