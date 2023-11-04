import 'Card.dart';

class PaymentMethodOptions {
  PaymentMethodOptions({
      this.card,});

  PaymentMethodOptions.fromJson(dynamic json) {
    card = json['card'] != null ? Card.fromJson(json['card']) : null;
  }
  Card card;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (card != null) {
      map['card'] = card.toJson();
    }
    return map;
  }

}