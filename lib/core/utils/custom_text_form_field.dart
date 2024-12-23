part of 'utils.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.identifiedPage,
    required this.identifiedAs,
    this.hint,
    this.readOnly,
    this.isRequired,
    this.textInputAction,
    this.textInputType,
    this.autoValidateMode,
    this.minLines,
    this.maxLines,
    this.prefixIcon,
    this.suffixIcon,
  });

  final TextEditingController controller;
  final String identifiedPage;
  final String identifiedAs;
  final String? hint;
  final bool? readOnly;
  final bool? isRequired;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final AutovalidateMode? autoValidateMode;
  final int? minLines;
  final int? maxLines;
  final IconButtonModel? prefixIcon;
  final IconButtonModel? suffixIcon;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool obscureTextValue = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        hintText: widget.hint ?? "",
        hintMaxLines: 1,
        hintStyle: TextStyleHelper.caption(),
        errorMaxLines: 1,
        errorStyle: TextStyleHelper.caption(color: ColorHelper.red),
        prefixIcon: prefixIcon(),
        suffixIcon: suffixIcon(),
      ),
      readOnly: readOnly(),
      obscureText: obscureText(),
      autovalidateMode: autoValidateMode(),
      validator: _ValidatorFormatter.helper(
        identifiedAs: widget.identifiedAs,
        isRequired: widget.isRequired,
      )["validator"],
      inputFormatters: _ValidatorFormatter.helper(
        identifiedAs: widget.identifiedAs,
        isRequired: widget.isRequired,
      )["formatters"],
      keyboardType: keyboardType(),
      textInputAction: textInputAction(),
      minLines: minLines(),
      maxLines: maxLines(),
      style: TextStyleHelper.caption(),
    );
  }

  readOnly() {
    return widget.readOnly ?? false;
  }

  obscureText() {
    if (widget.identifiedAs.contains("password")) {
      return obscureTextValue;
    }
    return false;
  }

  prefixIcon() {
    if (widget.prefixIcon != null) {
      return IconButton(
        onPressed: widget.prefixIcon!.onPressed,
        icon: Icon(widget.prefixIcon!.iconData, size: 22.sp),
      );
    }
    return null;
  }

  suffixIcon() {
    if (widget.identifiedAs.contains("password")) {
      return IconButton(
        onPressed: () {
          setState(() {
            obscureTextValue = !obscureTextValue;
          });
        },
        icon: Icon(
          obscureTextValue ? Icons.visibility : Icons.visibility_off,
        ),
      );
    }
    if (widget.suffixIcon != null) {
      return IconButton(
        onPressed: widget.suffixIcon!.onPressed,
        icon: Icon(widget.suffixIcon!.iconData, size: 22.sp),
      );
    }
    return null;
  }

  autoValidateMode() {
    return widget.autoValidateMode ?? AutovalidateMode.onUnfocus;
  }

  keyboardType() {
    return widget.textInputType ?? TextInputType.text;
  }

  textInputAction() {
    return widget.textInputAction ?? TextInputAction.done;
  }

  minLines() {
    return widget.minLines ?? 1;
  }

  maxLines() {
    return widget.maxLines ?? 1;
  }
}

class _ValidatorFormatter {
  static Map<String, dynamic> helper({
    required String identifiedAs,
    bool? isRequired = false,
  }) {
    if (identifiedAs == "phoneNumber") {
      return {
        "formatters": [
          FilteringTextInputFormatter.allow(RegExp(r'[0-9+]')),
        ],
        "validator": (value) {
          if (isRequired == true) {
            if (value == null || value.isEmpty) {
              return "Nomor HP tidak boleh kosong";
            }
            if (!value.startsWith("08") ||
                value.length < 10 ||
                value.length > 13) {
              return "Masukkan nomor HP yang valid";
            }
          }

          return null;
        },
      };
    }
    if (identifiedAs == "email") {
      return {
        "formatters": [
          FilteringTextInputFormatter.allow(
              RegExp(r'[a-zA-Z0-9!@#$%^&*(),.?":{}|<> ]'))
        ],
        "validator": (value) {
          if (isRequired == true) {
            if (value == null || value.isEmpty) {
              return 'Email tidak boleh kosong';
            }
            if (!RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$')
                .hasMatch(value)) {
              return 'Masukkan email yang valid';
            }
          }
          return null;
        },
      };
    }
    if (identifiedAs == "onlyText") {
      return {
        "formatters": [FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]'))],
        "validator": (value) {
          if (isRequired == true) {
            if (value == null || value.isEmpty) {
              return 'Harus diisi, tidak boleh kosong';
            }
          }
          return null;
        },
      };
    }
    return {
      "formatters": [
        FilteringTextInputFormatter.deny(
          RegExp(
            r'[\u{1F600}-\u{1F64F}'
            r'\u{1F300}-\u{1F5FF}'
            r'\u{1F680}-\u{1F6FF}'
            r'\u{1F1E0}-\u{1F1FF}'
            r'\u{2600}-\u{26FF}'
            r'\u{2700}-\u{27BF}'
            r'\u{FE00}-\u{FE0F}'
            r'\u{1F900}-\u{1F9FF}'
            r'\u{1F018}-\u{1F270}'
            r'\u{238C}-\u{2454}'
            r']',
            unicode: true,
          ),
        )
      ],
      "validator": (value) {
        return null;
      }
    };
  }
}

