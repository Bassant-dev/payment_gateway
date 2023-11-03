import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/styles.dart';

AppBar buildAppbar({final String ? title}){
  return AppBar(
    leading: Center(child: SvgPicture.asset('assets/images/Arrow.svg',)),
    centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: Text(
        title ??' ' ,
        textAlign: TextAlign.center,
        style: Styles.style25
    ),
  );
}