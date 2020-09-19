library bloc;

import 'package:rxdart/rxdart.dart';

import 'package:pemilihan_app/locator.dart';
import 'package:pemilihan_app/service/service.dart';
import 'package:pemilihan_app/model/model.dart';

part 'bloc_typeselection.dart';
part 'bloc_loginadmin.dart';
part 'bloc_loginpemantau.dart';
part 'bloc_dataviewer.dart';
part 'bloc_pemilihantempat.dart';

abstract class Bloc {
  void init();
  void dispose();
}