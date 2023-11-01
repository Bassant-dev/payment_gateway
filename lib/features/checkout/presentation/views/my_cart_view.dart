
import 'package:flutter/material.dart';
import 'package:payment_app/core/utils/styles.dart';
import 'package:flutter_svg/flutter_svg.dart';
class MyCartView extends StatelessWidget {
  const MyCartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Center(child: SvgPicture.asset('assets/images/Arrow.svg',)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'My Cart',
          textAlign: TextAlign.center,
          style: Styles.style25
        ),
      ),
      body: const MyCartViewBody() ,
    );
  }
}
class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 18,),
        Image.asset("assets/images/Group.png")
      ],
    );
  }
}
