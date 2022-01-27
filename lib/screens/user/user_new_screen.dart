import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_system_play_mono/blocs/bloc/userPageBloc/user_page_bloc.dart';
import 'package:sport_system_play_mono/constants.dart';
import 'package:sport_system_play_mono/helpers/view_alert.dart';
import 'package:sport_system_play_mono/models/rol_presenter.dart';
import 'package:sport_system_play_mono/models/user_presenter.dart';
import 'package:sport_system_play_mono/responsive.dart';
import 'package:sport_system_play_mono/services/user_service.dart';
import 'package:sport_system_play_mono/widgets/content_page.dart';
import 'package:sport_system_play_mono/widgets/input_text_form.dart';
import 'package:sport_system_play_mono/widgets/loading.dart';

class UserNewScreen extends StatefulWidget {
  final UserPageBloc userPageBloc;
  const UserNewScreen({Key? key, required this.userPageBloc}) : super(key: key);

  @override
  State<UserNewScreen> createState() => _UserNewScreenState();
}

class _UserNewScreenState extends State<UserNewScreen> {
  String dropdownvalue = '';
  TextEditingController controllerUser = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  List<RolPresenter> rolesSelect = [];
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Center(child: Loading()),
          )
        : Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(),
                        ElevatedButton.icon(
                          style: TextButton.styleFrom(
                            backgroundColor: successColor,
                            padding: EdgeInsets.symmetric(
                              horizontal: defaultPadding * 1.5,
                              vertical: defaultPadding /
                                  (Responsive.isMobile(context) ? 2 : 1),
                            ),
                          ),
                          onPressed: () async {
                            setState(() {
                              loading = true;
                            });
                            loading = true;
                            for (var element in listRoles) {
                              if (element.isSelect) {
                                rolesSelect
                                    .add(RolPresenter(name: element.name));
                              }
                            }

                            if (rolesSelect.isEmpty) {
                              viewAlert(context, "Error :(",
                                  "Debe Seleccionar al menos un Rol");
                              return;
                            }

                            UserPresenter userSave = UserPresenter(
                                username: controllerUser.text,
                                email: controllerEmail.text,
                                password: controllerPassword.text,
                                rolesPresenter: rolesSelect,
                                status: 'ACT',
                                createdDate: DateTime.now());

                            String messageValidate = validateUser(userSave);

                            if (messageValidate.isNotEmpty) {
                              viewAlert(context, "Error :(", messageValidate);
                              return;
                            }

                            widget.userPageBloc.add(NewUserEvent(userSave));

                            setState(() {
                              loading = true;
                            });
                          },
                          icon: Icon(Icons.add),
                          label: Text("Guardar"),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        ElevatedButton.icon(
                          style: TextButton.styleFrom(
                            backgroundColor: dangerColor,
                            padding: EdgeInsets.symmetric(
                              horizontal: defaultPadding * 1.5,
                              vertical: defaultPadding /
                                  (Responsive.isMobile(context) ? 2 : 1),
                            ),
                          ),
                          onPressed: () {
                            widget.userPageBloc
                                .add(UserScreenEvent(screenList));
                          },
                          icon: Icon(Icons.add),
                          label: Text("Cancelar"),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    BlocBuilder<UserPageBloc, UserPageState>(
                      builder: (_, state) {
                        if (state.userBlocModel!.paginatorUserModel != null &&
                            state.userBlocModel!.paginatorUserModel!.data!
                                .isNotEmpty) {
                          return ContentPage(
                            titleContent: 'Nuevo Usuario',
                            dataContent: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  InputTextForm(
                                      widthWidget: Responsive.isMobile(context)
                                          ? null
                                          : 500,
                                      labelText: 'Usuario',
                                      controller: controllerUser),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  InputTextForm(
                                      widthWidget: Responsive.isMobile(context)
                                          ? null
                                          : 500,
                                      labelText: 'Email',
                                      controller: controllerEmail),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  InputTextForm(
                                      widthWidget: Responsive.isMobile(context)
                                          ? null
                                          : 500,
                                      labelText: 'Clave',
                                      controller: controllerPassword),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    height: 80,
                                    width: 500,
                                    child: ListView.builder(
                                        itemCount: listRoles.length,
                                        itemBuilder: (_, index) {
                                          return CheckboxListTile(
                                            activeColor: primaryColor,
                                            title: Text(listRoles[index].name),
                                            value: listRoles[index].isSelect,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                listRoles[index].isSelect =
                                                    !listRoles[index].isSelect;
                                              });
                                            },
                                            secondary: const Icon(
                                                Icons.account_circle_sharp),
                                          );
                                        }),
                                  )
                                ],
                              ),
                            ),
                          );
                        } else {
                          return Text("No existe usuarios");
                        }
                      },
                    )
                  ],
                ),
              ),
            ],
          );
  }
}

String validateUser(UserPresenter user) {
  if (user.email.isEmpty) {
    return 'El campo email no puede estar vacio';
  }
  if (user.username.isEmpty) {
    return 'El campo nombre de usuario no puede estar vacio';
  }
  if (user.password!.isEmpty) {
    return 'El campo clave no puede estar vacia';
  }
  return '';
}
