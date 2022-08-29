import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:meal_notes/controllers/add_controller.dart';
import 'package:meal_notes/pages/add_page.dart';
import 'package:meal_notes/pages/myhome_page.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.doHyeonTextTheme(),
        primarySwatch: Colors.orange,
        // brightness: Brightness.dark
      ),
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''), // English, no country code
        Locale('ko', 'KR'), // Spanish, no country code
      ],
      getPages: [
        GetPage(name: '/', page: () => const MyHomePage(title: '현민 Demo Page')),
        GetPage(
          name: '/add',
          page: () => AddPage(),
          binding: BindingsBuilder((){
            Get.lazyPut<AddController>(() => AddController());
          }),
          transition: Transition.rightToLeft,
          transitionDuration: const Duration(milliseconds: 200),
          curve: Curves.fastOutSlowIn,
        )
      ],
    );
  }
}
