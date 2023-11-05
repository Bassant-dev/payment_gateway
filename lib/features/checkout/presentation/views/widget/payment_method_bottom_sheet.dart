import 'package:flutter/material.dart';
import 'package:payment_app/core/widget/custom_button.dart';
import 'package:payment_app/features/checkout/presentation/views/widget/custom_button_bloc_consumer.dart';
import 'package:payment_app/features/checkout/presentation/views/widget/payment_method_listview.dart';

class PaymentMethodsBottomSheet extends StatelessWidget {
  const PaymentMethodsBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 16,),
          PaymentMethodsListView(),
          SizedBox(height: 32,),
          CustomButtonBlocConsumer()
        ],
      ),
    );
  }
}

