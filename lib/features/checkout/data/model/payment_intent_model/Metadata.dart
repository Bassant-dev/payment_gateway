class Metadata {
  Metadata({
      this.idCart,});

  Metadata.fromJson(dynamic json) {
    idCart = json['id_cart'];
  }
  String idCart;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id_cart'] = idCart;
    return map;
  }

}