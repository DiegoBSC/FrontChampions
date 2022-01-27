import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sport_system_play_mono/constants.dart';

class InputTextForm extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;
  final double? widthWidget;

  const InputTextForm(
      {Key? key,
      required this.labelText,
      required this.controller,
      this.widthWidget})
      : super(key: key);

  @override
  State<InputTextForm> createState() => _InputTextFormState();
}

class _InputTextFormState extends State<InputTextForm> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.widthWidget,
      child: TextFormField(
        controller: widget.controller,
        decoration: InputDecoration(
          fillColor: bgColor,
          filled: true,
          labelText: widget.labelText,
          labelStyle: TextStyle(
            color: Colors.white60,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(width: 1, color: Colors.grey.shade700),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            borderSide: BorderSide(color: Colors.grey.shade500),
          ),
        ),
      ),
    );
  }
}
