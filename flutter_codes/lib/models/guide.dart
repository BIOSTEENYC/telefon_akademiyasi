class Guide {
  final String title;
  final String iconEmoji;
  final String documentUrl;

  Guide({
    required this.title,
    required this.iconEmoji,
    required this.documentUrl,
  });

  factory Guide.fromJson(Map<String, dynamic> json) {
    return Guide(
      title: json['title'],
      iconEmoji: json['icon_emoji'],
      documentUrl: json['document_url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'icon_emoji': iconEmoji,
      'document_url': documentUrl,
    };
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Guide &&
          runtimeType == other.runtimeType &&
          documentUrl == other.documentUrl;

  @override
  int get hashCode => documentUrl.hashCode;
}