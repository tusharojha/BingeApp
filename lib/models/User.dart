class User {
  String _name;
  int _avatar;
  String _token;

  // Constructor
  User(this._name, this._avatar);

  // Getters
  String get name => _name;

  int get avatar => _avatar;

  String get token => _token;

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
}
