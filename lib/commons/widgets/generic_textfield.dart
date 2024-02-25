
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum TextFieldType { date, text, dropdown, phone, country, email, password }

class GenericTextField extends StatelessWidget {
  final FocusNode? focusNode;
  final String? Function(String?)? validator;
  final String fieldName;
  final bool isAutoFocus;
  final String? subTitle;
  final List<TextInputFormatter>? formatters;
  final String? initialValue;
  final TextEditingController controller;
  final TextInputType? inputType;
  final String? hintText;
  final bool obscureText;
  final Function()? onTap;
  final bool readOnly;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final double? textFieldBottomPadding;
  final TextFieldType textFieldType;
  final Function(String)? onChanged;
  final Function(DateTime selectedDate)? selectedDate;
  final AutovalidateMode autovalidateMode;
  final int? maxLength;
  final Color? borderColor;
  final Color? fillColor;
  const GenericTextField({
    Key? key,
    this.fieldName = "",
    this.isAutoFocus = false,
    this.obscureText = false,
    this.prefixIcon,
    this.validator,
    this.selectedDate,
    this.maxLength,
    required this.controller,
    this.hintText,
    this.onTap,
    this.readOnly = false,
    this.suffixIcon,
    this.inputType,
    this.formatters,
    this.onChanged,
    this.textFieldType = TextFieldType.text,
    this.subTitle,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.initialValue,
    this.textFieldBottomPadding,
    this.focusNode,
    this.fillColor,
    this.borderColor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> showPassword = ValueNotifier(true);

    return Padding(
        padding: EdgeInsets.only(bottom: textFieldBottomPadding ?? 24),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          fieldName.isEmpty
              ? const SizedBox.shrink()
              : Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Text(
              fieldName,
              style: TextStyle(
                  color: Colors.grey, fontSize: 12,fontWeight: FontWeight.w400),
            ),
          ),
          ValueListenableBuilder(
              valueListenable: showPassword,
              builder: (BuildContext context, bool show, Widget? child) {
                return TextFormField(
                  focusNode: focusNode,
                  maxLength: maxLength,
                  cursorHeight: 18,
                  cursorColor: Colors.grey,
                  style: TextStyle(color: Colors.grey, fontSize: 13),
                  initialValue: initialValue,
                  textCapitalization: textFieldType == TextFieldType.email ||
                      textFieldType == TextFieldType.password
                      ? TextCapitalization.none
                      : TextCapitalization.sentences,
                  onChanged: onChanged,
                  autovalidateMode: autovalidateMode,
                  readOnly: textFieldType == TextFieldType.dropdown ||
                      textFieldType == TextFieldType.country
                      ? true
                      : readOnly,
                  inputFormatters: formatters,
                  controller: controller,
                  validator: validator,
                  keyboardType: inputType,
                  obscureText: obscureText && showPassword.value,
                  onTap:  onTap,
                  decoration: InputDecoration(
                    prefixIcon: prefixIcon,
                    isCollapsed: true,
                    fillColor: fillColor ?? Colors.white,
                    filled: true,
                    prefixIconConstraints: const BoxConstraints(
                      maxHeight: 25,
                      minHeight: 25,
                      minWidth: 25,
                    ),
                    suffixIconConstraints: const BoxConstraints(
                      maxHeight: 25,
                      minHeight: 25,
                      minWidth: 25,
                    ),
                    suffixIcon: obscureText == false
                        ? Padding(
                        padding: const EdgeInsets.only(
                          right: 14,
                        ),
                        child: suffixIcon)
                        : GestureDetector(
                      onTap: () {
                        showPassword.value = !showPassword.value;
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: Icon(
                          show ? Icons.visibility : Icons.visibility_off,
                          size: 22,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    hintText: hintText ?? fieldName,
                    enabledBorder: outlineInputBorder.copyWith(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: borderColor ?? Colors.grey)),
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                        fontSize: 14),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 15),
                    border: outlineInputBorder.copyWith(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color:borderColor ?? Colors.grey)),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 255, 0, 0),
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(color: borderColor ?? Colors.grey)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide:  BorderSide(color: borderColor ?? Colors.grey)),
                  ),
                );
              }),
        ]));
  }
}

final outlineInputBorder = OutlineInputBorder(
  borderSide: const BorderSide(color: Colors.grey),
  borderRadius: BorderRadius.circular(12),
);

// Widget? getPrefixIconFromInputType(
//     TextFieldType textInputType, Widget? prefixIcon) {
//   switch (textInputType) {
//     case TextFieldType.password:
//       return const Icon(Icons.visibility_off_rounded);
//     // case TextFieldType.email:
//     //   return const Icon(Icons.email_outlined);
//     default:
//       return prefixIcon;
//   }
// }

bool getShowPrefixIconPadding(
    TextFieldType textInputType,
    ) {
  switch (textInputType) {
    case TextFieldType.password:
    case TextFieldType.email:
      return true;
    default:
      return false;
  }
}

EdgeInsets prefixPadding = const EdgeInsets.only(left: 14, right: 11);
