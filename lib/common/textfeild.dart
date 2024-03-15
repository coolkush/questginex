// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:questginix/common/apptext.dart';
import 'package:sizer/sizer.dart';
import 'package:velocity_x/velocity_x.dart';

/* class CustumTextFeild extends StatelessWidget {
  final Widget? suxifIcon;
  final sufixIconOnTap;
  TextEditingController controller;
  final GestureTapCallback onPressed;
  final String Function(String?)? validator;
  final Function(String)? onchangevalue;
  // Icon iconsuffix;
  // Icon iconPrefix;
  Function()? oneditingComplete;
  FocusNode? focusNod;
  final bool onlyNumbers;
  final String hintText;
  final String labtext;
  final bool password;
  final bool enable;
  final double contwidth;
  final double contheight;
  final int maxlenght;
  TextInputType? mydata = TextInputType.text;
  int? maxlenthcontroller = 100;
  CustumTextFeild({
    Key? key,
    this.focusNod,
    this.sufixIconOnTap,
    this.suxifIcon,
    this.enable = true,
    this.labtext = "",
    this.mydata,
    this.oneditingComplete,
    required this.onPressed,
    this.maxlenthcontroller,
    required this.controller,
    required this.password,
    required this.hintText,
    this.validator,
    this.onchangevalue,
    this.contwidth = 0,
    this.onlyNumbers = false,
    this.contheight = 0,
    this.maxlenght = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
  }
}
 */

class CustumTextFeild extends StatefulWidget {
  final Widget? suxifIcon;
  final sufixIconOnTap;
  final bool isdark;
  final TextEditingController? controller;
  final GestureTapCallback onPressed;
  final String Function(String?)? validator;
  final Function(String)? onchangevalue;
  // Icon iconsuffix;
  Icon? iconPrefix;
  Function()? oneditingComplete;
  FocusNode? focusNod;
  final bool onlyNumbers;
  final String hintText;
  final String labtext;
  final bool password;
  final bool enable;
  final bool readOnly;
  bool showPass;
  final double contwidth;
  final double contheight;
  final int maxlenght;
  final double radius;
  TextInputType? mydata = TextInputType.text;
  int? maxlenthcontroller = 100;
  CustumTextFeild({
    super.key,
    this.controller,
    this.focusNod,
    this.iconPrefix,
    this.showPass = true,
    this.radius = 20,
    this.readOnly = false,
    this.sufixIconOnTap,
    this.suxifIcon,
    this.enable = true,
    this.labtext = "",
    this.mydata,
    this.oneditingComplete,
    required this.onPressed,
    this.maxlenthcontroller,
    required this.password,
    required this.hintText,
    this.validator,
    this.onchangevalue,
    this.contwidth = 0,
    this.onlyNumbers = false,
    this.contheight = 0,
    this.maxlenght = 1,
    required this.isdark,
  });

  @override
  State<CustumTextFeild> createState() => _CustumTextFeildState();
}

class _CustumTextFeildState extends State<CustumTextFeild> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
          maxHeight: 30.h,
          minHeight: widget.contheight == 0
              ? 100.h >= 795
                  ? 9.h
                  : 8.h
              : widget.contheight),
      width: widget.contwidth == 0 ? 100.w : widget.contwidth,
      child: TextFormField(
          controller: widget.controller,
          focusNode: widget.focusNod,
          maxLines: widget.maxlenght,
          onEditingComplete: widget.oneditingComplete,
          enabled: widget.enable,
          readOnly: widget.readOnly,
          minLines: 1,
          obscureText:
              widget.password == true ? widget.showPass : widget.password,
          inputFormatters: widget.onlyNumbers == true
              ? [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  LengthLimitingTextInputFormatter(widget.maxlenthcontroller)
                ]
              : [LengthLimitingTextInputFormatter(widget.maxlenthcontroller)],
          validator: widget.validator,
          onChanged: widget.onchangevalue,
          style: GoogleFonts.roboto(
            fontWeight: FontWeight.w600,
            fontSize: 11.sp,
            color: widget.isdark ? Colors.white : Colors.black,
          ),
          keyboardType: widget.mydata,
          decoration: InputDecoration(
            helperText: widget.labtext,
            hintStyle: GoogleFonts.roboto(
              // fontSize: 12.sp,
              color: widget.isdark ? Colors.white : Colors.black,
            ),
            suffixIcon: widget.suxifIcon,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.radius),
                borderSide: BorderSide(
                  width: 1.5,
                  color: widget.isdark ? Colors.white : Colors.black,
                )),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.radius),
                borderSide: BorderSide(
                  width: 1.5,
                  color: widget.isdark ? Colors.white : Colors.black,
                )),
            labelText: widget.hintText,
            labelStyle: GoogleFonts.roboto(
              fontSize: 12.sp,
              color: widget.isdark ? Colors.white : Colors.black,
            ),
          ),
          onTap: widget.onPressed),
    );
  }
}

class DropDownTextFeild extends StatefulWidget {
  final TextEditingController controller;
  final GestureTapCallback onPressed;
  final String Function(String?)? validator;
  final onChanged;
  final bool useonchange;
  // Icon iconsuffix;
  // Icon iconPrefix;
  final String hintText;
  final String labtext;
  final bool password;
  final bool enable;
  final double contwidth;
  final List<String> myListData;
  final double radius;
  final bool isdark;
  TextInputType? mydata = TextInputType.text;
  int? maxlenthcontroller = 100;
  DropDownTextFeild({
    super.key,
    this.enable = true,
    this.onChanged,
    this.useonchange = false,
    this.labtext = "",
    this.radius = 5,
    this.mydata,
    required this.onPressed,
    this.maxlenthcontroller,
    required this.controller,
    required this.isdark,
    required this.password,
    required this.hintText,
    this.validator,
    this.contwidth = 0,
    required this.myListData,
  });

  @override
  State<DropDownTextFeild> createState() => _DropDownTextFeildState();
}

class _DropDownTextFeildState extends State<DropDownTextFeild> {
  var myController;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: Colors.black,
      ),
      child: SizedBox(
        height: 7.h,
        width: widget.contwidth == 0 ? 100.w : widget.contwidth,
        child: FormField<String>(
          builder: (FormFieldState<String> state) {
            return InputDecorator(
              decoration: InputDecoration(
                hintText: widget.controller.text.isEmpty ? "Please Select" : "",
                floatingLabelBehavior: FloatingLabelBehavior.always,
                floatingLabelAlignment: FloatingLabelAlignment.start,
                labelStyle: GoogleFonts.roboto(
                  color: widget.isdark ? Colors.white : Colors.black,
                ),
                labelText: widget.hintText,
                hintStyle: GoogleFonts.roboto(
                  fontSize: 12.sp,
                  color: widget.isdark ? Colors.white : Colors.black,
                ),
                disabledBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(widget.radius)),
                    borderSide: BorderSide(
                      width: 1.5,
                      color: widget.isdark ? Colors.white : Colors.black,
                    )),
                focusedBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(widget.radius)),
                    borderSide: const BorderSide(
                      width: 1.5,
                      color: Colors.white,
                    )),
                enabledBorder: OutlineInputBorder(
                    borderRadius:
                        BorderRadius.all(Radius.circular(widget.radius)),
                    borderSide: BorderSide(
                      width: 1.5,
                      color: widget.isdark ? Colors.white : Colors.black,
                    )),
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(width: 1),
                ),
              ),
              isEmpty: true,
              child: DropdownButton(
                underline: const SizedBox(),
                isExpanded: true,
                alignment: AlignmentDirectional.topEnd,
                icon: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: widget.isdark ? Colors.white : Colors.black,
                ),
                iconDisabledColor: widget.isdark ? Colors.white : Colors.black,
                iconEnabledColor: widget.isdark ? Colors.white : Colors.black,
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w600,
                  fontSize: 11.sp,
                  color: widget.isdark ? Colors.white : Colors.black,
                ),
                // Not necessary for Option 1
                value: myController,

                onChanged: widget.useonchange == true
                    ? widget.onChanged
                    : (newValue) {
                        setState(() {
                          myController = newValue;
                          widget.controller.text = newValue.toString();
                        });
                      },
                items: widget.myListData.map((location) {
                  return DropdownMenuItem(
                    value: location,
                    child: Text(
                      location,
                      style: GoogleFonts.roboto(
                          color: widget.isdark ? Colors.white : Colors.black,
                          backgroundColor:
                              widget.isdark ? Colors.black : Colors.white),
                    ),
                  );
                }).toList(),
              ).pSymmetric(h: 10),
            );
          },
        ),
      ),
    );
  }
}
