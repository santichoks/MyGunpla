import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_gunpla/blocs/layout.dart';
import 'package:my_gunpla/blocs/sign_in.dart';
import 'package:my_gunpla/blocs/sign_up.dart';
import 'package:my_gunpla/common/constants.dart';
import 'package:my_gunpla/common/storage.dart';
import 'package:my_gunpla/pages/layout.dart';
import 'package:my_gunpla/pages/sign_in.dart';
import 'package:my_gunpla/pages/sign_up.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Storage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => SignInBloc(),
        ),
        BlocProvider(
          create: (BuildContext context) => SignUpBloc(),
        ),
        BlocProvider(
          create: (BuildContext context) => LayoutBloc(),
        ),
      ],
      child: MaterialApp(
        onGenerateRoute: (settings) {
          if (settings.name != "/signIn" && settings.name != "/signUp") {
            final String accessToken = Storage.getString(Constants.ACCESS_TOKEN);
            final String refreshToken = Storage.getString(Constants.REFRESH_TOKEN);
            if (accessToken.isEmpty || refreshToken.isEmpty) {
              return MaterialPageRoute(builder: (context) => const SignIn());
            }
          }

          switch (settings.name) {
            case "/signIn":
              return MaterialPageRoute(builder: (context) => const SignIn());
            case "/signUp":
              return MaterialPageRoute(builder: (context) => const SignUp());
            case "/application":
              return MaterialPageRoute(builder: (context) => const Layout());
            default:
              return MaterialPageRoute(builder: (context) => const Layout());
          }
        },
      ),
    );
  }
}
