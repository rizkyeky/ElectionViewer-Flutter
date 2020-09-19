// import 'package:flutix_training/model/model.dart';
import 'package:flutter/material.dart';
import 'package:pemilihan_app/page/page.dart';
// import 'view/page/page.dart';
// import 'Model/Model.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => TypeSelectionPage());
      case '/loginadmin':
        return MaterialPageRoute(builder: (_) => LogInAdminPage());
      case '/loginpemantau':
        return MaterialPageRoute(builder: (_) => LogInPemantauPage());
      case '/dataviewer':
        return MaterialPageRoute(builder: (_) => DataViewerPage());
      // case '/checkout':
      //   return MaterialPageRoute(builder: (_) => CheckoutPage());
      // case '/checkoutsuccess':
      //   return MaterialPageRoute(builder: (_) => const SuccessCheckoutPage());
      // case '/signup':
      //   return MaterialPageRoute(builder: (_) => SignUpPage());
      // case '/signin':
      //   return MaterialPageRoute(builder: (_) => SignInPage());
      // case '/preference':
      //   return MaterialPageRoute(builder: (_) => PreferencePage());
      // case '/editprofile':
      //   return MaterialPageRoute(builder: (_) => EditProfilePage());
      // case '/mytickets':
      //   return MaterialPageRoute(builder: (_) => MyTicketsPage());
      // case '/mytransaction':
      //   return MaterialPageRoute(builder: (_) => MyTransactionPage());
      // case '/detailticket':
      //   final Ticket ticket = settings.arguments as Ticket;
      //   return MaterialPageRoute(builder: (_) => DetailTicketPage(ticket));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}.'),
            ),
          ),
        );
    }
  }
}