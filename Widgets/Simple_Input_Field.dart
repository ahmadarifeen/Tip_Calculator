import 'package:flutter/material.dart';

class SimpleInputField extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final String hinttext;
  final IconData? iconData;

  const SimpleInputField({
    Key? key,
    required this.controller,
    required this.title,
    required this.hinttext,
    required this.iconData,
  }) : super(key: key);
  @override
  State<SimpleInputField> createState() => _SimpleInputFieldState();
}

class _SimpleInputFieldState extends State<SimpleInputField> {
  static const Color containerColor = Color(0xFFF5F8FB);
  static const Color textBlack = Color(0xFF232323);
  static const Color textLightBlack = Color(0xFF717171);
  static const Color clearButtonColor = Color(0xFFFF7511);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: textBlack,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          controller: widget.controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: widget.hinttext,
            hintStyle: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w400,
              color: textLightBlack,
            ),
            suffixIcon: Icon(
              widget.iconData ?? Icons.abc_outlined,
              color: textBlack,
            ),
            filled: true,
            fillColor: containerColor,
            border: OutlineInputBorder(
              borderSide: const BorderSide(width: 0, color: Colors.transparent),
              borderRadius: BorderRadius.circular(5),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 0, color: Colors.transparent),
              borderRadius: BorderRadius.circular(5),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 0, color: Colors.transparent),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          onFieldSubmitted: (value) {
            if (value.isEmpty) {
              widget.controller.text = "0.00";
            }
            widget.controller.text = value.toString();

            setState(() {});
          },
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter a valid amount";
            }
            return null;
          },
        ),
      ], // Close the children list here
    ); // Close the Column widget here
  }
}
