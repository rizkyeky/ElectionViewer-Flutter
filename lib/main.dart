import 'package:flutter/material.dart';
import 'locator.dart';
import 'router.dart';

Future<void> main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  
  setupLocator();
  await awaitSetupLocator();
  
  runApp(App());
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
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: isSignIn ? '/' : '/signin',
      onGenerateRoute: Router.generateRoute,
    );
  }
}