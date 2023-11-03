
import 'package:flutter/material.dart';
import 'package:payment_app/features/checkout/presentation/views/widget/payment_details_view_body.dart';

import '../../../../core/widget/custom_appbar.dart';

class PaymentDetailsView extends StatelessWidget {
  const PaymentDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: buildAppbar(title: 'Payment Details') ,
      body: const PaymentDetailsViewBody(),
    );
  }
}