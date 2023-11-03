import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:payment_app/core/widget/custom_button.dart';
import 'package:payment_app/features/checkout/presentation/views/widget/payment_method_listview.dart';

import 'custom_credit_card.dart';

class PaymentDetailsViewBody extends StatefulWidget {
  const PaymentDetailsViewBody({Key? key}) : super(key: key);

  @override
  State<PaymentDetailsViewBody> createState() => _PaymentDetailsViewBodyState();
}

class _PaymentDetailsViewBodyState extends State<PaymentDetailsViewBody> {
  final GlobalKey<FormState> formKey =GlobalKey();
  AutovalidateMode autovalidateMode=AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return   CustomScrollView(
    
        slivers: [
           const SliverToBoxAdapter(child: PaymentMethodsListView()),
          SliverToBoxAdapter(child: CustomCreditCard(
            autovalidateMode: autovalidateMode,

            formKey: formKey,
          )),
           SliverFillRemaining(
            hasScrollBody: false,
              child: Align(
                alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 12,left: 16,right: 16),
                    child: CustomButton(
                      onTap: (){
                        if(formKey.currentState!.validate()){
                          formKey.currentState!.save();

                        }
                        else{
                          autovalidateMode=AutovalidateMode.always;
                          setState(() {

                          });
                        }


                      },
                      text: 'Payment',
                    ),
                  )))
        ],
      
    );
  }
}