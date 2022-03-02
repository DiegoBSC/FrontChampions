import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sport_system_play_mono/constants.dart';

class Paginator extends StatefulWidget {
  int page;
  int size;
  int totalPage;
  Function(int)? onChangePage;

  Paginator(
      {Key? key,
      required this.page,
      required this.size,
      this.onChangePage,
      required this.totalPage})
      : super(key: key);

  @override
  State<Paginator> createState() => _PaginatorState();
}

class _PaginatorState extends State<Paginator> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          height: 40,
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            tooltip: 'Atras',
            onPressed: () {
              setState(() {
                if (widget.page > 0) {
                  widget.page -= 1;
                  widget.onChangePage!(widget.page);
                }
              });
            },
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Text(
            (widget.page + 1).toString() + ' / ' + widget.totalPage.toString()),
        SizedBox(
          width: 10,
        ),
        Container(
          decoration: BoxDecoration(
            color: primaryColor,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          height: 40,
          child: IconButton(
            icon: const Icon(Icons.arrow_forward_ios),
            tooltip: 'Adelante',
            onPressed: () {
              setState(() {
                if (widget.page < widget.totalPage - 1) {
                  widget.page += 1;
                  widget.onChangePage!(widget.page);
                }
              });
            },
          ),
        ),
      ],
    );
  }
}
