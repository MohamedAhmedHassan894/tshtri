import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/app_palette.dart';
import '../../utils/dimensions.dart';
import '../../utils/styles.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final bool isPassword;
  final Function(String)? onChanged;
  final Function? onSubmit;
  Function()? popUpCalculationClicked;
  final bool isEnabled;
  final int maxLines;
  final TextCapitalization capitalization;
  final IconData? prefixIcon;
  final IconData? suffixIcon;

  final bool divider;
  final bool smallPadding;
  CustomTextField(
      {this.hintText = 'Write something...',
      this.smallPadding = false,
      this.controller,
      this.focusNode,
      this.nextFocus,
      this.suffixIcon,
      this.isEnabled = true,
      this.inputType = TextInputType.text,
      this.inputAction = TextInputAction.next,
      this.maxLines = 1,
      this.onSubmit,
      this.onChanged,
      this.popUpCalculationClicked,
      this.prefixIcon,
      this.capitalization = TextCapitalization.none,
      this.isPassword = false,
      this.divider = false});

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          maxLines: widget.maxLines,
          controller: widget.controller,
          focusNode: widget.focusNode,
          style: AppTextStyles.montserratLight.copyWith(
              fontSize: widget.smallPadding
                  ? Dimensions.fontSizeSmall
                  : Dimensions.fontSizeLarge),
          textInputAction: widget.inputAction,
          keyboardType: widget.inputType,
          cursorColor: Theme.of(context).primaryColor,
          textCapitalization: widget.capitalization,
          enabled: widget.isEnabled,
          autofocus: false,
          obscureText: widget.isPassword ? _obscureText : false,
          inputFormatters: widget.inputType == TextInputType.phone
              ? <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp('[0-9]'))
                ]
              : null,
          decoration: InputDecoration(
            contentPadding: widget.smallPadding
                ? EdgeInsets.fromLTRB(
                    6.r,
                    6.r,
                    0.r,
                    4.r,
                  )
                : null,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
              borderSide: BorderSide(
                  style: BorderStyle.solid,
                  width: .5.w,
                  color: AppPalette.borderColor),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
              borderSide: BorderSide(
                  style: BorderStyle.solid,
                  width: .6.w,
                  color: AppPalette.primaryColor),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Dimensions.radiusDefault),
              borderSide: BorderSide(
                  style: BorderStyle.solid,
                  width: .1.w,
                  color: AppPalette.borderColor.withOpacity(.9)),
            ),
            isDense: true,
            hintText: widget.hintText,
            hintStyle:
                AppTextStyles.montserratMedium.copyWith(color: Colors.grey),
            filled: true,
            prefixIcon: widget.prefixIcon != null
                ? Icon(
                    widget.prefixIcon,
                    size: 18.sp,
                    color: AppPalette.primaryColor,
                  )
                : null,
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color: Theme.of(context).hintColor.withOpacity(0.3),
                        size: 14.sp),
                    onPressed: _toggle,
                  )
                : IconButton(
                    icon: Icon(widget.suffixIcon,
                        color: AppPalette.primaryColor, size: 18.sp),
                    onPressed: () {},
                  ),
          ),
          onSubmitted: (text) => widget.nextFocus != null
              ? FocusScope.of(context).requestFocus(widget.nextFocus)
              : widget.onSubmit != null
                  ? widget.onSubmit!(text)
                  : null,
          onChanged: widget.onChanged,
        ),
        widget.divider
            ? Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.paddingSizeLarge),
                child: const Divider())
            : const SizedBox(),
      ],
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
