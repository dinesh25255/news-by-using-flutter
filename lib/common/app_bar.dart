

import 'package:flutter/material.dart';

import '../constants/text_style.dart';

class AppBarWidget {


  static getAppBar({required String text, bool? isUpperCase}){
    return AppBar(
      title: Text(isUpperCase == null ? text : text.toUpperCase(), style: TextStyles.text,),
    );
  }

}