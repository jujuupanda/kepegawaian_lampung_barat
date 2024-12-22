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

  static Widget loadingWaveDots(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: ColorHelper.grayWithOpacity),
      child: Center(
        child: LoadingAnimationWidget.waveDots(
          color: ColorHelper.black,
          size: 50.sp,
        ),
      ),
    );
  }

  static Widget loadingShimmer(Widget child) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      enabled: true,
      child: Container(
        decoration: BoxDecoration(),
        child: child,
      ),
    );
  }

  static Widget emptyWidget() {
    return SizedBox();
  }

  static Widget baseFormField({
    required TextEditingController controller,
    required String identifiedPage,
  }) {
    return CustomTextFormField(
      controller: controller,
      identifiedPage: identifiedPage,
    );
  }
}

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField(
      {super.key, required this.controller, required this.identifiedPage});

  final TextEditingController controller;
  final String identifiedPage;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: "ini helper",
        hintMaxLines: 1,
        hintStyle: TextStyleHelper.caption(),
        errorMaxLines: 1,
        errorStyle: TextStyleHelper.caption(color: ColorHelper.red),
      ),
      readOnly: readOnly(),
      validator: validator(),
      inputFormatters: inputFormatters(),
      keyboardType: keyboardType(),
      textInputAction: textInputAction(),
      minLines: minLines(),
      maxLines: maxLines(),
      style: TextStyleHelper.caption(),
    );
  }

  readOnly() {}

  validator() {
    return null;
  }

  keyboardType() {
    return TextInputType.none;
  }

  inputFormatters() {
    return [];
  }

  textInputAction() {}

  minLines() {
    return 1;
  }

  maxLines() {
    return 1;
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
