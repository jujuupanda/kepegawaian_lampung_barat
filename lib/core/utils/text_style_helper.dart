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

  static TextStyle header1() {
    return _baseTextStyle(
      fontSize: 32.sp,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle header2() {
    return _baseTextStyle(
      fontSize: 24.sp,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle subHeader1() {
    return _baseTextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle subHeader2() {
    return _baseTextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle body1() {
    return _baseTextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle body2() {
    return _baseTextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle caption() {
    return _baseTextStyle(
      fontSize: 12.sp,
    );
  }

  static TextStyle overline() {
    return _baseTextStyle(
      fontSize: 10.sp,
    );
  }

  static TextStyle buttonText() {
    return _baseTextStyle(
      fontSize: 15.sp,
      fontWeight: FontWeight.w600,
    );
  }
}
