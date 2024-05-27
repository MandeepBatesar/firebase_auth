import 'package:flutter/material.dart';

class common_txtfield extends StatefulWidget {
  String hint_txt;
  IconData? suffixicon;
  Function? suffix_onpressed, onpressed;
  bool obscuretxt;
  bool readOnly;
  Function(String?)? validator;
  Function(String)? onChanged;

  TextEditingController? controller;
  common_txtfield(
      {super.key,
      required this.hint_txt,
      this.suffixicon,
      this.suffix_onpressed,
      this.onpressed,
      this.obscuretxt = false,
      this.readOnly = false,
      this.validator,
      this.controller,
      this.onChanged});

  @override
  State<common_txtfield> createState() => _common_txtfieldState();
}

class _common_txtfieldState extends State<common_txtfield> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: (v) => setState(() {
        widget.onChanged != null ? widget.onChanged!(v.toString()) : null;
      }),
      readOnly: widget.readOnly,
      onTap: widget.onpressed != null ? () => widget.onpressed!() : null,
      controller: widget.controller,
      validator:
          widget.validator == null ? null : (value) => widget.validator!(value),
      obscureText: widget.obscuretxt,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(15),
        suffixIcon: IconButton(
            onPressed: widget.suffix_onpressed != null
                ? () => widget.suffix_onpressed!()
                : null,
            icon: Icon(widget.suffixicon)),
        // hintStyle: AppTextTheme.fs16Medium().copyWith(color: AppColor.grey),
        hintText: widget.hint_txt,
        filled: true,
        // fillColor: AppColor.white,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(width: 0.7)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(width: 0.7)),
      ),
    );
  }
}
