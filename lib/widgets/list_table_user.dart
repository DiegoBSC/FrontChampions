import 'package:flutter/material.dart';
import 'package:sport_system_play_mono/constants.dart';
import 'package:sport_system_play_mono/global/value_label.dart';
import 'package:sport_system_play_mono/models/paginator_user_model.dart';
import 'package:sport_system_play_mono/models/user_presenter.dart';
import 'package:sport_system_play_mono/responsive.dart';

class ListTableUser extends StatefulWidget {
  final PaginatorUserModel? paginator;
  const ListTableUser({Key? key, this.paginator}) : super(key: key);

  @override
  State<ListTableUser> createState() => _ListTableUserState();
}

class _ListTableUserState extends State<ListTableUser> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ScrollController controller = ScrollController();

    return Expanded(
      child: ListView.builder(
        controller: controller,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          final item = widget.paginator!.data![index];

          return Responsive.isMobile(context)
              ? cardDataUserMovil(context, item, index + 1)
              : cardDataUser(context, item, index + 1);
        },
        itemCount: widget.paginator!.data!.length,
      ),
    );
  }
}

Container defaultContainer(context, Widget content) {
  return Container(
    margin: EdgeInsets.only(top: defaultPadding),
    padding: EdgeInsets.all(defaultPadding),
    decoration: BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.all(
        Radius.circular(defaultPadding),
      ),
    ),
    child: content,
  );
}

Widget cardDataUser(BuildContext context, UserPresenter presenter, int index) {
  return defaultContainer(
    context,
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: 50,
          child: Text('Nro. $index'),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.10,
          child: Text(
            presenter.username,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(
            width: MediaQuery.of(context).size.width * 0.20,
            child: Text(presenter.email)),
        Text(presenter.createdDate.toString().substring(0, 10)),
        Text(ValueLabel.stateLabel(presenter.status)),
        SizedBox(
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: successColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                height: 40,
                child: IconButton(
                  icon: const Icon(Icons.edit),
                  tooltip: 'Editar',
                  onPressed: () {
                    print("Boton Editarsssssss");
                  },
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: dangerColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                height: 40,
                child: IconButton(
                  icon: const Icon(Icons.delete),
                  tooltip: 'Eliminar',
                  onPressed: () {
                    print("Boton eliminar");
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget cardDataUserMovil(
    BuildContext context, UserPresenter presenter, int index) {
  return defaultContainer(
    context,
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text('Nro. $index'),
        SizedBox(
          width: 15,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                presenter.username,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                presenter.email,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                presenter.createdDate.toString().substring(0, 10),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                ValueLabel.stateLabel(presenter.status),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        Column(
          children: [
            SizedBox(
              height: 30,
              width: 10,
            ),
            Container(
              decoration: BoxDecoration(
                color: successColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              height: 40,
              child: IconButton(
                icon: const Icon(Icons.edit),
                tooltip: 'Editar',
                onPressed: () {
                  print("Boton Editar");
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                color: dangerColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              height: 40,
              child: IconButton(
                icon: const Icon(Icons.delete),
                tooltip: 'Eliminar',
                onPressed: () {
                  print("Boton eliminar");
                },
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
