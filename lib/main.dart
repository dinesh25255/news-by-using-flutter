

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/constants/colors.dart';
import 'package:news/views/search_page.dart';

void main(){

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xff4870CF),

      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark

  ));

  runApp(const ProviderScope(child: Home()));

}


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto', 
        scaffoldBackgroundColor: AppColor.white,
          appBarTheme: AppBarTheme(
            elevation: 0,
            color: AppColor.blueColor,
          ),
      ),
      home:  SearchPage(),
    );
  }
}
