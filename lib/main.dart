import 'package:arami/common/view/splash_screen.dart';
import 'package:arami/library/provider/makingbook_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MakingBookProvider(),)
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => MediaQuery(data: MediaQuery.of(context).copyWith(
        textScaleFactor: 1.0,
      ), child: child!),
      theme: ThemeData(
        fontFamily: 'Noto Sans KR',
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
