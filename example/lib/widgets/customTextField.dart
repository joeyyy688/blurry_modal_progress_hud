import 'package:blurry_modal_progress_hud_example/mediaQuery/sizeHelpers.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType? keybaordType;
  const CustomTextField(
      {Key? key,
      required this.controller,
      required this.hintText,
      required this.keybaordType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: displayWidth(context) * 0.84,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
      child: TextFormField(
        showCursor: true,
        readOnly: false,
        style: TextStyle(
          fontFamily: 'LibreBaskerville',
          fontSize: displayWidth(context) * 0.040,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
        textCapitalization: TextCapitalization.sentences,
        controller: controller,
        cursorColor: Colors.black,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'This field cannot be empty';
          }

          return null;
        },
        enabled: true,
        autofocus: false,
        keyboardType: keybaordType,
        decoration: InputDecoration(
            helperStyle: TextStyle(
                fontSize: displayWidth(context) * 0.031,
                fontWeight: FontWeight.w700,
                color: Colors.grey),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 0),
                borderRadius: BorderRadius.circular(10)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                width: 0,
                color: Colors.white,
              ),
            ),
            hintText: hintText,
            hintStyle: TextStyle(
                fontSize: displayWidth(context) * 0.03,
                fontWeight: FontWeight.normal),
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            )),
      ),
    );
  }
}
