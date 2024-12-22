part of 'utils.dart';

class ColorHelper {
  static Color _colorHelper(String hex) {
    return Color(int.parse("0X$hex"));
  }

  static Color black = Color(0xFF000000);
}
