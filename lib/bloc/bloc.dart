library bloc;

import 'package:rxdart/rxdart.dart';

import 'package:pemilihan_app/locator.dart';
import 'package:pemilihan_app/service/service.dart';

part 'bloc_typeselection.dart';
part 'bloc_loginadmin.dart';

abstract class Bloc {
  void init();
  void dispose();
}