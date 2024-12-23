part of 'utils.dart';

class DialogContentModel {
  final String title;
  final String content;

  const DialogContentModel({
    required this.title,
    required this.content,
  });

  DialogContentModel copyWith({String? title, String? content}) {
    return DialogContentModel(
      title: title ?? this.title,
      content: content ?? this.content,
    );
  }
}

class IconButtonModel {
  final IconData iconData;
  final VoidCallback? onPressed;

  const IconButtonModel({required this.iconData, this.onPressed});
}
