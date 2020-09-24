// import 'dart:convert';a

import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart' as fire_auth;
import 'package:cloud_firestore/cloud_firestore.dart'  as fire_store;
import 'package:firebase_core/firebase_core.dart' as fire_core;
import 'package:http/http.dart' as http;

import 'package:pemilihan_app/locator.dart';
import 'package:pemilihan_app/model/model.dart';

part 'service_core.dart';
part 'service_auth.dart';
part 'service_user.dart';
part 'service_calon.dart';
part 'service_kecamatan.dart';
part 'service_kelurahan.dart';
part 'service_suara.dart';