import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local/features/homescreen/presentation/widgets/bottomnavbar.dart';
import 'core/routes/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Local',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const BottomNavBar(),
      routes: allRoutes,
    );
  }
}
