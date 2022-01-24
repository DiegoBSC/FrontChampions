import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sport_system_play_mono/blocs/bloc/user_bloc.dart';
import 'package:sport_system_play_mono/constants.dart';
import 'package:sport_system_play_mono/controllers/menu_controller.dart';
import 'package:sport_system_play_mono/screens/loading_page/loading_page.dart';
import 'package:sport_system_play_mono/screens/login/login_screen.dart';
import 'package:sport_system_play_mono/screens/main/main_screen.dart';
import 'package:sport_system_play_mono/services/auth_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => UserBloc())],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => MenuController(),
          ),
          ChangeNotifierProvider(
            create: (context) => AuthService(),
          ),
        ],
        child: MaterialApp(
            scrollBehavior: MaterialScrollBehavior().copyWith(
              dragDevices: {
                PointerDeviceKind.mouse,
                PointerDeviceKind.touch,
                PointerDeviceKind.stylus,
                PointerDeviceKind.unknown
              },
            ),
            debugShowCheckedModeBanner: false,
            title: 'Reserva Canchas Admin',
            routes: {
              'mainscreen': (_) => MainScreen(screenSelect: 'Dashboard'),
              'login': (_) => LoginPage(),
              'loading': (_) => LoadingPage(),
            },
            theme: ThemeData.dark().copyWith(
              scaffoldBackgroundColor: bgColor,
              textTheme:
                  GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
                      .apply(bodyColor: Colors.white),
              canvasColor: secondaryColor,
            ),
            initialRoute: "loading"),
      ),
    );
  }
}
