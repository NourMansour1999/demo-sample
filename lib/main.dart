import 'package:easy_localization/easy_localization.dart';
import 'package:echo_cash/core/constants/app_constants.dart';
import 'package:echo_cash/core/utils/SharedPreferences/SharedPreferencesHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'core/routes/routes.dart';
import 'injection_container.dart' as dependency_injector;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await AppSharedPreferences.init();
  await dependency_injector.init();
  
  runApp(   EasyLocalization(
    supportedLocales: languages.values.toList(),
    path: 'assets/locales',
    fallbackLocale: const Locale('en'),
    startLocale: const Locale('en'),
    saveLocale: true,
    child: Phoenix(child: const MyApp()),
  ),);
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Sample',
      debugShowCheckedModeBanner: false,
      supportedLocales: languages.values.toList(),
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: customRoutes,
      initialRoute: '/',
    );
  }
}
