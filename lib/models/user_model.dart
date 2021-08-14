class UserModel {
  final String id;
  final String username;
  final String email;
  final String bio;
  final String photoUrl;

  UserModel({
    required this.id,
    required this.username,
    required this.email,
    required this.bio,
    required this.photoUrl,
  });

  UserModel.fromData(Map<String, dynamic> data)
      : id = data['id'],
        email = data['email'],
        photoUrl = data['photoUrl'],
        username = data['username'],
        bio = data['bio'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'photoUrl': '',
      'username': email,
      'bio': 'Welcome to RoboDoc!',
    };
  }

  Map<String, dynamic> data({required UserModel user}) {
    return {
      'id': user.id,
      'email': user.email,
      'photoUrl': user.photoUrl,
      'username': user.username,
      'bio': user.bio,
    };
  }
}
