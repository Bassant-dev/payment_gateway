import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_app/features/checkout/presentation/manager/payment_cubit.dart';
import 'package:payment_app/features/checkout/presentation/views/thank_you_view.dart';

import '../../../../../core/widget/custom_button.dart';
import '../../../data/model/payment_intent_input_model/payment_intent_input_model.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listener: (context, state) {
        if(state is PaymentSuccess){
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
            return const ThankYouView();
          }));

        }
        if(state is PaymentFailure){
          Navigator.of(context).pop();
          SnackBar snackBar=SnackBar(content: Text(state.errMessage));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);

        }
      },
      builder: (context, state) {

        return  CustomButton(isLoading: state is PaymentLoading?true :false,
            text: 'Continue',
        onTap: (){
          PaymentIntentInputModel paymentIntentInputModel = PaymentIntentInputModel(
            amount: '100',
            currency: 'USD',
          );
          BlocProvider.of<PaymentCubit>(context).makePayment(paymentIntentInputModel: paymentIntentInputModel );
        },);
      },
    );
  }
}