import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_system_play_mono/blocs/bloc/userPageBloc/user_page_bloc.dart';
import 'package:sport_system_play_mono/constants.dart';
import 'package:sport_system_play_mono/responsive.dart';
import 'package:sport_system_play_mono/widgets/content_page.dart';
import 'package:sport_system_play_mono/widgets/list_table_user.dart';

class UserNewScreen extends StatefulWidget {
  final UserPageBloc userPageBloc;
  const UserNewScreen({Key? key, required this.userPageBloc}) : super(key: key);

  @override
  State<UserNewScreen> createState() => _UserNewScreenState();
}

class _UserNewScreenState extends State<UserNewScreen> {
  @override
  Widget build(BuildContext context) {
    return Row(
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
                    onPressed: () {
                      print('Guardar');
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
                      widget.userPageBloc.add(UserScreenEvent(screenList));
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
                          children: [
                            SizedBox(
                              height: 20,
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
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.grey.shade700),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide:
                                        BorderSide(color: Colors.grey.shade500),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: Responsive.isMobile(context) ? null : 500,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  fillColor: bgColor,
                                  filled: true,
                                  labelText: 'Clave',
                                  labelStyle: TextStyle(
                                    color: Colors.white60,
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide: BorderSide(
                                        width: 1, color: Colors.grey.shade700),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    borderSide:
                                        BorderSide(color: Colors.grey.shade500),
                                  ),
                                ),
                              ),
                            ),
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
