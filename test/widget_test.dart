// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

// import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter_test/flutter_test.dart';
// import 'package:pemilihan_app/model/model.dart';
// import 'package:pemilihan_app/service/service.dart';

// import 'package:pemilihan_app/main.dart';

Future<void> main() async {
  // final KecamatanService _serviceKeca = KecamatanService();
  // final KelurahanService _serviceKelu = KelurahanService();

  // final List<Kecamatan> listKec = await _serviceKeca.getKecamatans();
  
  // for (var kec in listKec) {
  //   print('${kec.name} ${kec.id}');
  //   final List<Kelurahan> listKel = await _serviceKelu.getKelurahans(kec.id);
  //   listKel.forEach((element) {print('-${element.name}');});
  // }
  var bytes = utf8.encode(100.toString()); // data being hashed

  var md5Convert = md5.convert(bytes);
  // var sha1Convert = sha1.convert(bytes);

  // print("Digest as bytes: $bytes");
  print("md5Convert as hex string: $md5Convert");
  // print("sha1Convert as hex string: $sha1Convert");
  // print("margerConvert as hex string: $margerConvert");
}
