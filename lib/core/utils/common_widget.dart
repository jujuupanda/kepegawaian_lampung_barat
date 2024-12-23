part of 'utils.dart';

class CommonWidget {
  static void dialogBox(
    BuildContext context,
    DialogContentModel dialogModel,
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

  static Widget textFormField({
    required TextEditingController controller,
    required String identifiedAs,
    required String identifiedPage,
    String? hint,
    bool? isRequired,
    bool? readOnly,
    AutovalidateMode? autoValidationMode,
    TextInputType? textInputType,
    TextInputAction? textInputAction,
    int? minLines,
    int? maxLines,
    IconButtonModel? prefixIcon,
    IconButtonModel? suffixIcon,
  }) {
    return CustomTextFormField(
      controller: controller,
      identifiedPage: identifiedPage,
      identifiedAs: identifiedAs,
      hint: hint,
      isRequired: isRequired,
      readOnly: readOnly,
      autoValidateMode: autoValidationMode,
      textInputType: textInputType,
      textInputAction: textInputAction,
      minLines: minLines,
      maxLines: maxLines,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
    );
  }
}

