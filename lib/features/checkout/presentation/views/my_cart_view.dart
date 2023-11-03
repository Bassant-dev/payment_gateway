
import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:payment_app/features/checkout/presentation/views/widget/my_cart_view_body.dart';

import '../../../../core/widget/custom_appbar.dart';
class MyCartView extends StatelessWidget {
  const MyCartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(title: 'My Cart'),
      body: const MyCartViewBody() ,
    );
  }
}


