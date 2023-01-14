import 'dart:convert';

SingIn? singInFromJson(String str) => SingIn.fromJson(json.decode(str));

String singInToJson(SingIn? data) => json.encode(data!.toJson());

class SingIn {
  SingIn({
    this.id,
  });

  int? id;

  factory SingIn.fromJson(Map<String, dynamic> json) => SingIn(
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
  };
}
