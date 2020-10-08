import 'package:flutter/material.dart';
// import 'package:pemilihan_app/service/service.dart';
import 'package:pemilihan_app/share/share.dart';
import 'locator.dart';
import 'router.dart';

Future<void> main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  
  setupLocator();
  await awaitSetupLocator();

  runApp(const App());
}

class App extends StatelessWidget {
  
  const App();

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
      onGenerateRoute: XRouter.generateRoute,
    );
  }
}