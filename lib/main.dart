import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'initapp.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterConfig.loadEnvVariables();
  myApp();
}
