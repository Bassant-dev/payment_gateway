
import 'package:dartz/dartz.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/utils/stripe_services.dart';
import '../model/payment_intent_input_model/payment_intent_input_model.dart';
import 'checkout_repo.dart';

class CheckoutRepoImpl extends CheckoutRepo {
  final StripeService stripeService = StripeService();
  @override
  Future<Either<Failure, void>> makePayment(
      {required PaymentIntentInputModel paymentIntentInputModel}) async {
    try {
      await stripeService.makePayment(
          paymentIntentInputModel: paymentIntentInputModel);

      return right(null);
    } on StripeException catch (e) {
      return left(ServerFailure(
          errMessage: e.error.message ?? 'Oops there was an error'));
    } catch (e) {
      return left(ServerFailure(errMessage: e.toString()));
    }
  }
}