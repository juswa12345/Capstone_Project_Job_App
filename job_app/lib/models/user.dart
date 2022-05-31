class Users {
  String id;
  String imgUrl;
  String username;
  String email;
  String password;
  String firstname;
  String lastname;

  Users({
    required this.id,
    required this.imgUrl,
    required this.username,
    required this.email,
    required this.password,
    required this.firstname,
    required this.lastname,
  });

  factory Users.fromJson(Map<String, dynamic> json){
    return Users(
      id: json['id'] as String,
      imgUrl: json['imgUrl'] as String,
      username: json['username'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      firstname: json['firstname'] as String,
      lastname: json['lastname'] as String,
    );
  }
}
