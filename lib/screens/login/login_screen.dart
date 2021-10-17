import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sport_system_play/constants.dart';
import 'package:sport_system_play/responsive.dart';
import 'package:sport_system_play/screens/main/main_screen.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Flexible(
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
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MainScreen()));
                  },
                  icon: Icon(Icons.add),
                  label: Text("Ingresar"),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }

  Widget _emailTextField() {
    return SizedBox(
      width: 400,
      child: TextField(
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
          decoration: _decorationStyle(
              "Clave",
              Icon(
                Icons.password,
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
}
