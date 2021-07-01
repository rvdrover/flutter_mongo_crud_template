import 'package:flutter/material.dart';
import 'package:fluttermongocrud/providers/crud_provider.dart';
import 'package:fluttermongocrud/views/home_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData.dark(),
          home: HomeView(),
        ),
        providers: [
          ChangeNotifierProvider(
            create: (_) => CrudProvider(),
          ),
        ]);
  }
}
