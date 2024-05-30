import 'package:flutter/material.dart';
import 'injection.dart';
import 'provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Injection.init();
  runApp(const AppBlocProvider());
}
