import 'package:app/views/myapp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:app/views/myhome.dart';
import 'package:app/views/entrada.dart';
import 'package:app/views/maps.dart';
import 'package:app/views/cadastro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'firebase_options.dart';






void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);


  runApp(const MyApp());
}




