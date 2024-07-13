class User {
  final String id;
  final String email;

  User({required this.id, required this.email});

  factory User.fromFirestore(Map<String, dynamic> data, String documentId) {
    return User(
      id: documentId,
      email: data['email'] ?? '',
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'email': email,
    };
  }
}
