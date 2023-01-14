import 'dart:convert';

Token? tokenFromJson(String str) => Token.fromJson(json.decode(str));

String tokenToJson(Token? data) => json.encode(data!.toJson());

class Token {
  Token({
    this.token,
  });

  String? token;

  factory Token.fromJson(Map<String, dynamic> json) => Token(
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "token": token,
  };
}
