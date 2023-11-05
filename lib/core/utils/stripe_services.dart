
import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_app/core/utils/api_keys.dart';
import 'package:payment_app/features/checkout/data/model/payment_intent_input_model/payment_intent_input_model.dart';
import 'package:payment_app/features/checkout/data/model/payment_intent_model/payment_intent_model.dart';

import 'api_services.dart';

class StripeService {
  final ApiService apiServices  = ApiService();
  Future<PaymentIntentModel> createPaymentIntent(PaymentIntentInputModel paymentIntentInputModel) async{
    var response =await apiServices.post(body:paymentIntentInputModel.toJson(),
        url: "https://api.stripe.com/v1/payment_intents",
        token:ApiKeys.secretKey,
    contentType: Headers.formUrlEncodedContentType);
    var paymentIntentModel=PaymentIntentModel.fromJson(response.data);
    return  paymentIntentModel;

  }
  Future initPaymentSheet(
      {required String paymentIntentClientSecrete}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntentClientSecrete,
        merchantDisplayName: 'bassant',
      ),
    );
  }
  Future displayPaymentSheet() async{
  await  Stripe.instance.presentPaymentSheet();

  }
  Future makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    var paymentIntentModel = await createPaymentIntent(paymentIntentInputModel);
    await initPaymentSheet(paymentIntentClientSecrete:paymentIntentModel.clientSecret!);

    await displayPaymentSheet();
  }

}