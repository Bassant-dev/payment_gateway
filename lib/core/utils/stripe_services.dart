
import 'package:payment_app/features/checkout/data/model/payment_intent_input_model/payment_intent_input_model.dart';
import 'package:payment_app/features/checkout/data/model/payment_intent_model/payment_intent_model.dart';

import 'api_services.dart';

class StripeService {
  final ApiService apiServices  = ApiService();
  PaymentIntentModel createPaymentIntent(PaymentIntentInputModel paymentIntentInputModel){
    apiServices.post(body:paymentIntentInputModel.toJson(), url: "https://api.stripe.com/v1/payment_intents", token: token)

  }

}