import 'package:flutter/material.dart';
import 'package:pemilihan_app/service/service.dart';
import 'package:pemilihan_app/share/share.dart';
import 'locator.dart';
import 'router.dart';

Future<void> main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  
  setupLocator();
  await awaitSetupLocator();
  
  await UserService.findType('V3eM9KN4529999FBPbTD');

  runApp(const App(isSignIn: true,));
}

class App extends StatelessWidget {
  
  final bool isSignIn;

  const App({this.isSignIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pemilihan App',
      theme: ThemeData(
        cursorColor: mainColor,
        primaryColor: mainColor,
        accentColor: greyColor,
        canvasColor: whiteColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      onGenerateRoute: Router.generateRoute,
    );
  }
}