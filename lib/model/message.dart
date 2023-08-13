class Messages {
  Messages({required this.message});

  final String message;
  factory Messages.fromJson(jsonData) {
    return Messages(message: jsonData['message']);
  }
}
