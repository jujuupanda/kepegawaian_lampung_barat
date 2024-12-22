part of 'utils.dart';

class CommonWidget {
  static void dialogBox(
    BuildContext context,
    DialogModel dialogModel,
  ) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(dialogModel.title),
        content: Text(dialogModel.content),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text("Tutup"),
          ),
        ],
      ),
    );
  }

  static void secureWarning(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text("Resiko Keamanan"),
        content: Text(
            "Aplikasi mendeteksi bahwa perangkat Anda tidak aman. Mohon gunakan perangkat yang aman."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            // onPressed: () => exit(0),
            child: Text("Keluar"),
          ),
        ],
      ),
    );
  }
}

class DialogModel {
  final String title;
  final String content;

  const DialogModel({
    required this.title,
    required this.content,
  });

  DialogModel copyWith({String? title, String? content}) {
    return DialogModel(
      title: title ?? this.title,
      content: content ?? this.content,
    );
  }
}
