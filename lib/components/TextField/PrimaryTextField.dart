import 'package:firebase_authntication/Services/AppServices.dart';
import 'package:firebase_authntication/constant/AppTextTheme.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Primary_txtField extends StatefulWidget {
  String hint_txt;
  String? title;
  IconData? suffixicon, prefix;
  Function? suffix_onpressed, onpressed, prefix_onpressed;
  bool obscuretxt;
  bool fillcolor;
  bool readOnly;
  final TextInputType keyboardType;
  Function(String?)? validator;
  Function(String)? onChanged;
  TextEditingController? controller;
  Primary_txtField(
      {super.key,
      required this.hint_txt,
      this.suffixicon,
      this.suffix_onpressed,
      this.onpressed,
      this.fillcolor = false,
      this.obscuretxt = false,
      this.readOnly = false,
      this.keyboardType = TextInputType.text,
      this.validator,
      this.controller,
      this.onChanged,
      this.prefix_onpressed,
      this.title,
      this.prefix});

  @override
  State<Primary_txtField> createState() => _common_txtfieldState();
}

class _common_txtfieldState extends State<Primary_txtField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.title == null
            ? const SizedBox()
            : Text(
                widget.title!,
                style: AppTextTheme().fs16Normal,
              ),
        heightY(6),
        TextFormField(
          keyboardType: widget.keyboardType,
          onChanged: (v) => setState(() {
            widget.onChanged != null ? widget.onChanged!(v.toString()) : null;
          }),
          readOnly: widget.readOnly,
          onTap: widget.onpressed != null ? () => widget.onpressed!() : null,
          controller: widget.controller,
          validator: widget.validator == null
              ? null
              : (value) => widget.validator!(value),
          obscureText: widget.obscuretxt,
          decoration: InputDecoration(
              // contentPadding: const EdgeInsets.all(15),
              constraints: const BoxConstraints(minHeight: 50),
              prefixIcon: widget.prefix == null
                  ? null
                  : Icon(
                      widget.prefix,
                      color: AppColors().primary,
                    ),
              suffixIcon: IconButton(
                  onPressed: widget.suffix_onpressed != null
                      ? () => widget.suffix_onpressed!()
                      : null,
                  icon: Icon(
                    widget.suffixicon,
                    color: AppColors().gray,
                  )),
              hintStyle: AppTextTheme().fs16Normal,
              hintText: widget.hint_txt,
              filled: true,
              fillColor:
                  widget.fillcolor ? AppColors().bgclr : AppColors().white,
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: AppColors().white)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: AppColors().white)),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: AppColors().red)),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: AppColors().red))),
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class Datetimetextfield extends StatelessWidget {
  String hint;
  Function onpressed;
  TextEditingController? controller;
  bool readOnly;
  Datetimetextfield(
      {super.key,
      required this.hint,
      required this.onpressed,
      this.controller,
      this.readOnly = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(
        //   title,
        //   style: AppTextTheme().fs16Normal.copyWith(color: AppColors().primary),
        // ),

        Primary_txtField(
          readOnly: readOnly,
          controller: controller,
          suffix_onpressed: () {
            onpressed();
          },
          suffixicon: Icons.calendar_month,
          hint_txt: hint,
          fillcolor: true,
        ),
      ],
    );
  }
}
