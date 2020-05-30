import 'dart:convert';

class User {
  String _name;
  int _avatar;
  String _token;
  String _fcmToken;

  // Constructor
  User(this._name, this._avatar, this._fcmToken);

  User.withToken(this._name, this._avatar, this._fcmToken, this._token);

  // From Json
  factory User.fromJson(Map<String, dynamic> json) {
    return User.withToken(
        json['name'], json['avatar'], json['fcmToken'], json['token']);
  }

  // to Json
  String toJson(){
    return jsonEncode(<String, dynamic>{
      'name': name,
      'avatar': avatar,
      'fcmToken': fcmToken,
      'token': token
    });
  }

  // Getters
  String get name => _name;

  int get avatar => _avatar;

  String get token => _token;

  String get fcmToken => _fcmToken;

  // Setters
  set name(String name) {
    this._name = name;
  }

  set avatar(int avatar) {
    this._avatar = avatar;
  }

  set token(String token) {
    this._token = token;
  }

  set fcmToken(String token) {
    this._fcmToken = token;
  }
}
