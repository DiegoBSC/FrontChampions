import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sport_system_play_mono/constants.dart';
import 'package:sport_system_play_mono/responsive.dart';

class DropdownContainer extends StatefulWidget {
  final DropdownButtonFormField dropdownButtonFormField;
  const DropdownContainer({Key? key, required this.dropdownButtonFormField})
      : super(key: key);

  @override
  State<DropdownContainer> createState() => _DropdownContainerState();
}

class _DropdownContainerState extends State<DropdownContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: Responsive.isMobile(context) ? null : 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: bgColor,
        ),
        child: widget.dropdownButtonFormField);
  }
}
