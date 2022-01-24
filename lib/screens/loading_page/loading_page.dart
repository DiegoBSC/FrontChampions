import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sport_system_play_mono/constants.dart';
import 'package:sport_system_play_mono/screens/login/login_screen.dart';
import 'package:sport_system_play_mono/screens/main/main_screen.dart';
import 'package:sport_system_play_mono/services/auth_service.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: checkLoginState(context),
        builder: (context, snapshot) {
          return Center(
            child: Text(
              "Espere...",
              style: TextStyle(color: primaryColor, fontSize: 20),
            ),
          );
        },
      ),
    );
  }

  Future checkLoginState(BuildContext context) async {
    final authService = Provider.of<AuthService>(context, listen: false);
    final isLogin = await authService.isLoggedIn();

    if (isLogin) {
      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
              pageBuilder: (_, __, ___) =>
                  MainScreen(screenSelect: 'dashboard'),
              transitionDuration: Duration(seconds: 15)));
    } else {
      Navigator.pushReplacement(
          context,
          PageRouteBuilder(
              pageBuilder: (_, __, ___) => LoginPage(),
              transitionDuration: Duration(seconds: 15)));
    }
  }
}
