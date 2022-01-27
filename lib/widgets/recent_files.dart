import 'package:flutter/material.dart';
import 'package:sport_system_play_mono/models/recent_file.dart';
import 'package:sport_system_play_mono/responsive.dart';

import '../../../constants.dart';

class RecentFiles extends StatelessWidget {
  const RecentFiles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String dropdownvalue = 'ROLE_USER';
    List<String> items = ['ROLE_ADMIN', 'ROLE_USER'];
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Ultimas Reservas",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(width: double.infinity, child: Text("tABLA")),
          TextFormField(
            decoration: InputDecoration(
              fillColor: bgColor,
              filled: true,
              hintText: "Usuario",
              labelText: 'Usuario',
              labelStyle: TextStyle(
                color: primaryColor,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(width: 1, color: primaryColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: primaryColor),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          SizedBox(
            width: Responsive.isMobile(context) ? null : 400,
            child: DropdownButtonFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.grey.shade500),
                ),
              ),
              value: dropdownvalue,
              icon: Icon(Icons.keyboard_arrow_down),
              items: items.map((String items) {
                return DropdownMenuItem(value: items, child: Text(items));
              }).toList(),
              onChanged: (newValue) {
                dropdownvalue = newValue.toString();
              },
            ),
          ),
          SizedBox(
            height: 50,
          ),
          SizedBox(
            width: Responsive.isMobile(context) ? null : 500,
            child: TextFormField(
              decoration: InputDecoration(
                fillColor: bgColor,
                filled: true,
                labelText: 'Usuario',
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
          ),
          Container(
            width: Responsive.isMobile(context) ? null : 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: bgColor,
            ),
            child: DropdownButtonFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(color: Colors.grey.shade500),
                ),
              ),
              value: dropdownvalue,
              icon: Icon(Icons.keyboard_arrow_down),
              items: items.map((String items) {
                return DropdownMenuItem(value: items, child: Text(items));
              }).toList(),
              onChanged: (newValue) {
                dropdownvalue = newValue.toString();
              },
            ),
          )
        ],
      ),
    );
  }
}

DataRow recentFileDataRow(RecentFile fileInfo) {
  return DataRow(
    cells: [
      DataCell(
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Text(fileInfo.title!),
            ),
          ],
        ),
      ),
      DataCell(Text(fileInfo.date!)),
      DataCell(Text(fileInfo.size!)),
    ],
  );
}
