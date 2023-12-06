import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TxtField extends StatelessWidget {
  const TxtField(
      {Key? key,
      this.controller,
      this.keyboardType,
      this.validator,
      this.hintText,
      this.onSaved,
      this.suffixIcon,
      this.onTap,
      this.onChanged,
      this.minLines = 1,
      this.maxLines = 1,
      this.readOnly = false,
      this.enabled = true,
      this.obscureText = false})
      : super(key: key);

  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final String? hintText;
  final void Function(String?)? onSaved;
  final Widget? suffixIcon;
  final bool obscureText;
  final bool enabled;
  final int? minLines;
  final int? maxLines;
  final bool readOnly;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
          color: Get.isDarkMode ? Colors.grey[500] : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        enabled: enabled,
        controller: controller,
        keyboardType: keyboardType,
        readOnly: readOnly,
        validator: validator,
        obscureText: obscureText,
        minLines: minLines,
        maxLines: maxLines,
        onTap: onTap,
        onChanged: onChanged,
        decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            hintText: hintText,
            suffixIcon: suffixIcon == null
                ? null
                : Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      width: 40,
                      decoration: BoxDecoration(
                          color: Get.isDarkMode
                              ? Colors.grey[50]
                              : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: suffixIcon,
                      ),
                    ),
                  )),
        onSaved: onSaved,
      ),
    );
  }
}

class DateField extends StatelessWidget {
  const DateField(
      {Key? key,
      this.controller,
      this.keyboardType,
      this.validator,
      this.hintText,
      this.onSaved,
      this.onTap,
      this.suffixIcon,
      this.obscureText = false})
      : super(key: key);
  final Function()? onTap;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final String? hintText;
  final void Function(String?)? onSaved;
  final Widget? suffixIcon;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
          color: Get.isDarkMode ? Colors.grey[500] : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        validator: validator,
        obscureText: obscureText,
        onTap: onTap,
        readOnly: true,
        decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
            hintText: hintText,
            suffixIcon: suffixIcon == null
                ? null
                : Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      width: 40,
                      decoration: BoxDecoration(
                          color: Get.isDarkMode
                              ? Colors.grey[50]
                              : Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: suffixIcon,
                      ),
                    ),
                  )),
        onSaved: onSaved,
      ),
    );
  }
}
