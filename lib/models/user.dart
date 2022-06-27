class User {
  User(
      {this.id,
      this.name,
      this.email,
      this.username,
      this.profilePhotoUrl,
      this.token});

  int? id;
  String? name;
  String? email;
  String? username;
  String? profilePhotoUrl;
  String? token;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        username: json["username"],
        profilePhotoUrl: json["profile_photo_url"],
        token: json["access_token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "username": username,
        "profile_photo_url": profilePhotoUrl,
        "access_token": token,
      };
}

class UninitializedUser extends User {}
