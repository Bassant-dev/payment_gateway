
import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:payment_app/core/utils/api_keys.dart';

import 'package:payment_app/features/checkout/data/model/payment_intent_input_model/payment_intent_input_model.dart';
import 'package:payment_app/features/checkout/data/model/payment_intent_model/payment_intent_model.dart';

import '../../features/checkout/data/model/ephemeralkey_model/EphemralKey.dart';
import '../../features/checkout/data/model/init_payment_sheet_input_model.dart';
import '../../features/checkout/data/model/paymentintent_model/payment_intent_model.dart';
import 'api_services.dart';

class StripeService {
  final ApiService apiServices  = ApiService();
  Future<PaymentIntentModel> createPaymentIntent(PaymentIntentInputModel paymentIntentInputModel) async{
    var response =await apiServices.post(
        body:paymentIntentInputModel.toJson(),
        url: "https://api.stripe.com/v1/payment_intents",
        token:ApiKeys.secretKey,
        contentType: Headers.formUrlEncodedContentType);
    var paymentIntentModel=PaymentIntentModel.fromJson(response.data);
    return  paymentIntentModel;

  }
  Future initPaymentSheet(
      {required InitPaymentSheetInputModel initPaymentSheetInputModel}) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: initPaymentSheetInputModel.clientSecrete,
        customerEphemeralKeySecret: initPaymentSheetInputModel.ephemeralKetSecrete,
        customerId: initPaymentSheetInputModel.customerId,
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
    var ephemeralKeyModel = await createEphemeralKey(customerId: paymentIntentInputModel.customerId);
    var initPaymentSheetInputModel=InitPaymentSheetInputModel(clientSecrete: paymentIntentModel.clientSecret!,
        customerId: paymentIntentInputModel.customerId,
        ephemeralKetSecrete: ephemeralKeyModel.secret!);
    await initPaymentSheet(initPaymentSheetInputModel: initPaymentSheetInputModel);

    await displayPaymentSheet();
  }
  Future< EphemeralKeyModel> createEphemeralKey({required String customerId}) async{
    var response =await apiServices.post(
        body: {
      'customer':customerId
    },
        url: "https://api.stripe.com/v1/ephemeral_keys",
        token:ApiKeys.secretKey,
        headers: {
          'Authorization': "Bearer ${ApiKeys.secretKey}",
          'Stripe-Version':'2023-10-16'
        },
        contentType: Headers.formUrlEncodedContentType);
    var ephemeralKeyModel= EphemeralKeyModel.fromJson(response.data);
    return  ephemeralKeyModel;

  }

}

