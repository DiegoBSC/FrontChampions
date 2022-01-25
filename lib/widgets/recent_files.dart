import 'package:flutter/material.dart';
import 'package:sport_system_play_mono/models/recent_file.dart';

import '../../../constants.dart';

class RecentFiles extends StatelessWidget {
  const RecentFiles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            initialValue: '',
            maxLength: 20,
            decoration: InputDecoration(
                icon: Icon(
                  Icons.favorite,
                  color: primaryColor,
                ),
                labelText: 'Usuario',
                labelStyle: TextStyle(
                  color: primaryColor,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: primaryColor),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(width: 1, color: primaryColor),
                ),
                focusColor: Colors.red),
            focusNode: FocusNode(),
          ),

//Modelo
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Tell us about yourself',
                helperText: 'Keep it short, this is just a demo.',
                labelText: 'Life story',
                prefixIcon: const Icon(
                  Icons.person,
                  color: Colors.green,
                ),
                prefixText: ' ',
                suffixText: 'USD',
                suffixStyle: const TextStyle(color: Colors.green)),
          ),
//Modelo
          Theme(
            data: ThemeData(
                primaryColor: primaryColor, primaryColorDark: primaryColor),
            child: TextField(
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(width: 1, color: primaryColor),
                  ),
                  border: OutlineInputBorder(),
                  hintText: 'Digita nombre de usuario',
                  labelText: 'Nombre Usuario',
                  prefixIcon: const Icon(
                    Icons.person,
                    color: primaryColor,
                  ),
                  suffixStyle: const TextStyle(color: Colors.green)),
            ),
          ),
          SizedBox(
            height: 50,
          ),

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
          )
          // DataTable2(
          //   columnSpacing: defaultPadding,
          //   minWidth: 600,
          //   columns: const [
          //     DataColumn(
          //       label: Text("Nro. Cancha"),
          //     ),
          //     DataColumn(
          //       label: Text("Fecha"),
          //     ),
          //     DataColumn(
          //       label: Text("Horario"),
          //     ),
          //   ],
          // rows: List.generate(
          // demoRecentFiles.length,
          //   (index) => recentFileDataRow(demoRecentFiles[index]),
          // ),
          // ),
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
