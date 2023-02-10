import 'package:flutter/material.dart';
import 'package:note_app/constant/color.dart';
import 'package:note_app/constant/style.dart';

class TextFieldCustom extends StatelessWidget {
  const TextFieldCustom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.black54,
      style: textStyle.copyWith(
        color: primaryColor,
        
      ),
      decoration: InputDecoration(
        // border: InputBorder.none,

        prefixIcon: const Icon(
          Icons.search,
          color: Color(0xff6a6c6d),
        ),
        filled: true,
        fillColor: Colors.grey.shade300,
        hintText: 'Search anything',
        hintStyle: const TextStyle(
          fontSize: 13,
          color: Color.fromARGB(255, 156, 156, 157),
          fontWeight: FontWeight.w500,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 16.0,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              4,
            ),
          ),
          borderSide: BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
        ),
      ),
    );
  }
}
