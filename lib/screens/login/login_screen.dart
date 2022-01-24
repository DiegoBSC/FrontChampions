import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sport_system_play_mono/constants.dart';
import 'package:sport_system_play_mono/helpers/view_alert.dart';
import 'package:sport_system_play_mono/responsive.dart';
import 'package:sport_system_play_mono/services/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/Logo-01.png",
                  width: 300,
                ),
                SizedBox(
                  height: 30,
                ),
                _emailTextField(),
                SizedBox(
                  height: 15,
                ),
                _passwordTextFiled(),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton.icon(
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xFF6aa84f),
                    padding: EdgeInsets.symmetric(
                      horizontal: defaultPadding * 6,
                      vertical: defaultPadding /
                          (Responsive.isMobile(context) ? 2 : 1),
                    ),
                  ),
                  onPressed: authService.loading
                      ? null
                      : () async {
                          FocusScope.of(context).unfocus();
                          final loginResponse = await authService.login(
                              emailCtrl.text.trim(), passCtrl.text.trim());

                          if (loginResponse) {
                            // Navegar otra pantalla
                            Navigator.pushReplacementNamed(
                                context, 'mainscreen');
                          } else {
                            viewAlert(context, "Error :(",
                                "Credenciales incorrectas");
                          }
                        },
                  icon: Icon(Icons.input),
                  label: Text("Ingresar"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _emailTextField() {
    return SizedBox(
      width: 400,
      child: TextField(
          autocorrect: false,
          controller: emailCtrl,
          decoration: _decorationStyle(
              "Email",
              Icon(
                Icons.email,
                color: primaryColor,
              ))),
    );
  }

  Widget _passwordTextFiled() {
    return SizedBox(
      width: 400,
      child: TextField(
          autocorrect: false,
          controller: passCtrl,
          obscureText: true,
          decoration: _decorationStyle(
              "Clave",
              Icon(
                Icons.lock_outline,
                color: primaryColor,
              ))),
    );
  }

  _decorationStyle(String placeholder, Icon icon) {
    return InputDecoration(
      hintText: placeholder,
      fillColor: secondaryColor,
      filled: true,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      suffixIcon: InkWell(
        onTap: null,
        child: Container(
          padding: EdgeInsets.all(defaultPadding * 0.75),
          margin: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
          child: icon,
        ),
      ),
    );
  }

  bool isloginUser() {
    //Traer Token
    return false;
  }
}
