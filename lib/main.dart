import 'package:clean_movie_app/app_module.dart';
import 'package:clean_movie_app/app_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'features/presentation/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ModularApp(module: AppModule(), child: AppWidget());
  }
}
