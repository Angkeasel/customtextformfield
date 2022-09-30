import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

//import 'package:flutter_svg/flutter_svg.dart';
//import 'package:intl/intl.dart';

//import '../configs/constant/app_colors.dart';

class CustomTextfield extends StatelessWidget {
  final TextEditingController? controller;
  final String? label, hint, prefix, initialValue;
  final Color? hintColor;
  final Widget? suffix, prefixWidget;
  final bool? isEmpty;
  final bool? isPassword;
  final Function(String)? onChanged;
  final Function()? onTap;
  final Function(String)? onSubmit;
  final String? Function(String?)? validator;
  final TextInputType? keyType;
  final bool? readOnly;
  final bool? enabled;
  final List<TextInputFormatter>? format;
  final EdgeInsets? padding;
  final Function(DateTime)? onDateTimeChanged;
  final Widget? dropDonwWidget;
  final int? minLines;
  const CustomTextfield({
    Key? key,
    this.controller,
    this.initialValue,
    this.onChanged,
    this.onTap,
    this.onSubmit,
    this.validator,
    this.label,
    this.hint,
    this.hintColor,
    this.prefix = '',
    this.prefixWidget,
    this.suffix,
    this.isEmpty = true,
    this.isPassword,
    this.keyType,
    this.readOnly,
    this.enabled,
    this.format,
    this.padding,
    this.onDateTimeChanged,
    this.dropDonwWidget,
    this.minLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (onDateTimeChanged != null) {
          showCupertinoModalPopup(
            context: context,
            builder: (context) => Container(
              height: 260,
              color: Colors.white,
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CupertinoButton(
                      child: Text(
                        'Cancel',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    CupertinoButton(
                      child: Text(
                        'Done',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Color(0xff0F50A4)),
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
                SizedBox(
                  height: 200,
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    onDateTimeChanged: onDateTimeChanged!,
                    dateOrder: DatePickerDateOrder.dmy,
                    initialDateTime: controller!.text != ''
                        ? DateFormat('dd-MM-yyyy').parse(controller!.text)
                        : DateTime.now(),
                  ),
                ),
              ]),
            ),
          );
        } else if (dropDonwWidget != null) {
          showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.vertical(top: Radius.circular(10))),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              builder: (context) => dropDonwWidget!);
        } else if (onTap != null) {
          onTap!();
        }
      },
      child: Container(
        padding: padding ?? const EdgeInsets.only(right: 15, left: 15, top: 15),
        color: Colors.transparent,
        child: TextFormField(
            controller: controller,
            initialValue: initialValue,
            onChanged: onChanged,
            // onTap: onTap,
            onFieldSubmitted: onSubmit,
            inputFormatters: format,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: validator,
            obscureText: isPassword ?? false,
            obscuringCharacter: '●',
            keyboardType: keyType,
            readOnly: readOnly ?? false,
            enabled: enabled ?? true,
            minLines: minLines ?? 1,
            maxLines: 5,
            decoration: InputDecoration(
              label: RichText(
                  text: TextSpan(
                      text: label ?? "",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontWeight: FontWeight.w500),
                      children: [
                        TextSpan(
                            text: '*',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(color: Colors.red, fontSize: 20))
                      ])),

              hintText: hint ?? '',
              alignLabelWithHint: true,
              hintStyle: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontWeight: FontWeight.w500,
                  color: hintColor ?? Colors.black),
              prefixIcon: prefix != ''
                  ? Padding(
                padding: const EdgeInsets.all(13),
                child: Image.asset(
                  prefix ?? '',
                  color: isEmpty! ? Colors.grey[200] : Colors.black,
                ),
              )
                  : prefixWidget,
              suffixIcon: Padding(
                padding: const EdgeInsets.all(12),
                child: dropDonwWidget != null
                    ? Icon(
                  Icons.arrow_drop_down,
                  color: isEmpty! ? Colors.grey : Color(0xff0F50A4),
                )
                    : onDateTimeChanged != null
                    ? Icon(
                  Icons.calendar_month_rounded,
                  color: isEmpty! ? Colors.grey : Color(0xff0F50A4),
                )
                    : suffix,
              ),
              isDense: true,
              // floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              filled: true,
              fillColor: isEmpty!
                  ? Colors.grey[200]
                  : Colors.transparent,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: isEmpty! ? BorderSide.none : const BorderSide()),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: isEmpty! ? BorderSide.none : const BorderSide()),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.red),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.red),
              ),
            )),
      ),
    );
  }
}
