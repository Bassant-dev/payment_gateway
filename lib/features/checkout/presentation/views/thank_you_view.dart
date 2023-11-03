
import 'package:flutter/material.dart';
import 'package:payment_app/features/checkout/presentation/views/widget/thank_you_view_body.dart';

import '../../../../core/widget/custom_appbar.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(),
      body: Transform.translate(
          offset: const Offset(0, -16), child: const ThankYouViewBody()),
    );
  }
}